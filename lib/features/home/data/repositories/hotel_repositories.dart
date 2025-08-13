import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/shared/services/json_data_services.dart';

class HotelRepositories {
  final JsonDataServices jsonDataServices;

  HotelRepositories({required this.jsonDataServices});

  Future<List<Hotel>> fetchHotels() {
    return jsonDataServices.loadHotels();
  }

  Future<Hotel> getHotelById(String id) {
    return jsonDataServices.loadHotels().then(
      (hotels) => hotels.firstWhere((hotel) => hotel.id == id),
    );
  }
}
