import 'package:Hotelino/features/home/presentation/homeProvider.dart';
import 'package:Hotelino/features/home/widgets/ad_banner.dart';
import 'package:Hotelino/features/home/widgets/home_app_bar.dart';
import 'package:Hotelino/features/home/widgets/hotel_list_section.dart';
import 'package:Hotelino/features/home/widgets/hotel_vertical_list.dart';
import 'package:Hotelino/features/home/widgets/search_bar.dart';
import 'package:Hotelino/features/home/widgets/story_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            SearchBarWidget(),
            SizedBox(height: 16),
            AdBanner(),
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
