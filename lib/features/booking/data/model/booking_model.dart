import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingModel {
  String FullName;
  String Destination;
  JalaliRange? checkInOutRange;

  String NumberOfGusts;
  String phoneNumber;

  
  BookingModel({
    this.FullName = '',
    this.Destination = '',
    this.checkInOutRange,
    this.NumberOfGusts = '',
    this.phoneNumber = '',
  });
}
