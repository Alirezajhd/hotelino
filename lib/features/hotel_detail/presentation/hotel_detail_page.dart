import 'package:Hotelino/core/utils/networkImage.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repositories.dart';
import 'package:Hotelino/shared/services/json_data_services.dart';
import 'package:flutter/material.dart';

class HotelDetailPage extends StatelessWidget {
  final String hotelId;
  const HotelDetailPage({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    final hotelRepositorie = HotelRepositories(
      jsonDataServices: JsonDataServices(),
    );
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<Hotel>(
      future: hotelRepositorie.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final hotel = snapshot.data!;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  fit: BoxFit.cover,
                  networkUrl(hotel.images.first),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
