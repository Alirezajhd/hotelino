import 'package:Hotelino/core/constants/constants.dart';
import 'package:Hotelino/features/home/data/models/home_page_data.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repositories.dart';
import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  final HotelRepositories _hotelRepositories;

  Homeprovider(this._hotelRepositories) {
    fetchHotels();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;

  fetchHotels() async {
    _hotels = await _hotelRepositories.fetchHotels();
    notifyListeners();
  }

  // Filter Methods ----------------------------------------------------------------------------------------------

  List<Hotel> getPopularHotels() {
    return _hotels
        .where((hotel) => _homePageData.popular.contains(hotel.id))
        .toList();
  }

  List<Hotel> getSpecialOffersHotels() {
    return _hotels
        .where((hotel) => _homePageData.specialOffers.contains(hotel.id))
        .toList();
  }

  List<Hotel> getNewestHotels() {
    return _hotels
        .where((hotel) => _homePageData.newest.contains(hotel.id))
        .toList();
  }

  // Story Section ------------------------------------------------------------------------------------------------

  List<String> getStoryImages() {
    final shuffledHotels = List<Hotel>.from(_hotels)..shuffle();
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTitles = [
    "امکانات رفاهی کامل",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها",
  ];

  List<String> get storyTitles => _storyTitles;
}
