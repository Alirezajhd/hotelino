import 'package:Hotelino/features/home/presentation/homeProvider.dart';
import 'package:Hotelino/features/home/widgets/ad_banner.dart';
import 'package:Hotelino/features/home/widgets/home_app_bar.dart';
import 'package:Hotelino/features/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<Homeprovider>(context);
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 16),
          SearchBarWidget(),
          SizedBox(height: 16),
          AdBanner(),
        ],
      ),
    );
  }
}
