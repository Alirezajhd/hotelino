import 'package:Hotelino/core/utils/networkImage.dart';
import 'package:Hotelino/core/utils/price_formater.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/provider/favoriteProvider.dart';
import 'package:Hotelino/features/home/presentation/widgets/animated_favorite_button.dart';
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
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "${hotel.rating} (${formatPrice(hotel.reviewCount)})",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        hotel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        "${hotel.city}, ${hotel.country}",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "از ${formatPrice(hotel.pricePerNight)} / شب",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "مشاهده و انتخاب اتاق",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
