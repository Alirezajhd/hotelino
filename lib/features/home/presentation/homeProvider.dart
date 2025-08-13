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

  fetchHotels() async {
    _hotels = await _hotelRepositories.fetchHotels();
    notifyListeners();
  }
}
