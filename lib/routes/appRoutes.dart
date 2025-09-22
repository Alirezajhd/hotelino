import 'package:Hotelino/features/home/presentation/homePage.dart';
import 'package:Hotelino/features/onboarding/presentation/onboarding_page.dart';
import 'package:Hotelino/routes/main_bottom_nav.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const MainBottomNav(),
  };
}
