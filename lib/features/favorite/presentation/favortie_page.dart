import 'package:Hotelino/features/favorite/presentation/widgets/favorite_item.dart';
import 'package:Hotelino/features/home/presentation/provider/favoriteProvider.dart';
import 'package:Hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavortiePage extends StatelessWidget {
  const FavortiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "هتل های مورد علاقه",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const SearchBarWidget(),
            const SizedBox(height: 16),
            Consumer<FavotireItemProvider>(
              builder: (context, favoriteProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favoriteProvider.favoriteHotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: FavoriteHotelCard(
                        hotel: favoriteProvider.favoriteHotelList[index],
                        onRemoveFavotiteClicked: (hotelId) {
                          favoriteProvider.toggleFavorite(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
