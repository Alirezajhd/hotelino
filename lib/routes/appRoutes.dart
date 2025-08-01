import 'package:Hotelino/features/home/homePage.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    home: (ctx) => const HomePage(),
  };
}
