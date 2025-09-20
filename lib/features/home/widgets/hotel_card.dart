import 'package:Hotelino/core/utils/networkImage.dart';
import 'package:Hotelino/core/utils/price_formater.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/favoriteProvider.dart';
import 'package:Hotelino/features/home/widgets/animated_favorite_button.dart';
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    networkUrl(hotel.images[0]),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: AnimatedFavoriteButton(
                    isFavorite: isFavorite,
                    onTap: () {
                      favoriteProvider.toggleFavorite(hotel.id);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "${hotel.rating} (${formatPrice(hotel.reviewCount)})",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        hotel.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        "${hotel.city}, ${hotel.country}",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      "از ${formatPrice(hotel.pricePerNight)} / شب",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "مشاهده و انتخاب اتاق",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
