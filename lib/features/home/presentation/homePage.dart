import 'package:Hotelino/features/home/presentation/provider/homeProvider.dart';
import 'package:Hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:Hotelino/features/home/presentation/widgets/home_app_bar.dart';
import 'package:Hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:Hotelino/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:Hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:Hotelino/features/home/presentation/widgets/story_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const SearchBarWidget(),
            const SizedBox(height: 16),
            const AdBanner(),
            Consumer<Homeprovider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  hotels: homeProvider.getPopularHotels(),
                  title: "محبوبترین هتل ها",
                  onSeeAllPressed: () {},
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<Homeprovider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  hotels: homeProvider.getSpecialOffersHotels(),
                  title: "پیشنهاد ویژه امروز",
                  onSeeAllPressed: () {},
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<Homeprovider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryImages(),
                  titles: homeProvider.storyTitles,
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<Homeprovider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                  title: "جدیدترین هتل ها",
                  hotels: homeProvider.getNewestHotels(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
