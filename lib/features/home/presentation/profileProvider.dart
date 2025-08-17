import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/models/profile.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repositories.dart';
import 'package:Hotelino/features/home/data/repositories/profile_repositories.dart';
import 'package:flutter/material.dart';

class Profileprovider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepositories _hotelRepositories;

  List<Hotel> _hotels = [];

  Profile? _profile;
  Profile? get profile => _profile;

  Profileprovider(this._hotelRepositories, this._profileRepository) {
    loadUserProfile();
    fetchHotels();
  }

  loadUserProfile() async {
    _profile = await _profileRepository.fetchUserProfile();
    notifyListeners();
  }

  fetchHotels() async {
    _hotels = await _hotelRepositories.fetchHotels();
    notifyListeners();
  }

  // Recently Viewed Hotels ----------------------------------------------------------------------------------
  final List<String> _recentlyViewedHotels = [];

  List<Hotel> get recentlyViewedHotels =>
      _hotels
          .where((hotel) => _recentlyViewedHotels.contains(hotel.id))
          .toList();

  void addRecentlyViewed(String hotelId) {
    if (!recentlyViewedHotels.contains(hotelId)) {
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    } else {
      _recentlyViewedHotels.remove(hotelId);
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    }
  }
}
