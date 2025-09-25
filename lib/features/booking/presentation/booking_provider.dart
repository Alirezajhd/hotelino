import 'package:Hotelino/features/booking/data/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider with ChangeNotifier {
  final BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;

  void setName(String value) {
    _booking.FullName = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _booking.Destination = value;
    notifyListeners();
  }

  void setRange(JalaliRange value) {
    _booking.checkInOutRange = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _booking.phoneNumber = value;
    notifyListeners();
  }

  void setNumberOfGusts(String value) {
    _booking.NumberOfGusts = value;
    notifyListeners();
  }
}
