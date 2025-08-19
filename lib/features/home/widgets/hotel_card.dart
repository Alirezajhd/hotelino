import 'package:Hotelino/core/utils/price_formater.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  HotelCard({super.key, required this.hotel});
  Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavotireItemProvider>(context);
    bool isFavorite = favoriteProvider.isFavorite(hotel.id);

    return SizedBox(
      width: 280,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(children: []),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text("${hotel.rating} (${formatPrice(hotel.reviewCount)})"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
