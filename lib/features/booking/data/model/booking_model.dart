import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingModel {
  String fullName;
  String destination;
  JalaliRange? checkInOutRange;

  String numberOfGusts;
  String phoneNumber;

  
  BookingModel({
    this.fullName = '',
    this.destination = '',
    this.checkInOutRange,
    this.numberOfGusts = '',
    this.phoneNumber = '',
  });
}
