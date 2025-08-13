import 'dart:convert';

import 'package:Hotelino/core/constants/constants.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/routes/appRoutes.dart';
import 'package:flutter/services.dart';

class JsonDataServices {
  Future<List<Hotel>> loadHotels() async {
    final String respons = await rootBundle.loadString(AppConstants.hotelsData);
    final Map<String, dynamic> jsonData = jsonDecode(respons);

    final List<dynamic> hotelsList = jsonData["hotels"];
    return hotelsList
        .map((hotel) => Hotel.fromJson(hotel as Map<String, dynamic>))
        .toList();
  }
}
