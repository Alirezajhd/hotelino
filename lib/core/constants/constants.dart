import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppConstants {
  static const String baseUrlImage =
      "https://dunijet.ir/content/project/hotelino/";
  static const String hotelsData = "assets/data/hotels.json";
}

class AppColors {
  static const Color primary = Color(0XFFB27258);

  //Light Theme Colors
  static const Color lightText = Color(0XFF000000);
  static const Color lightHint = Color(0XFF9196A3);
  static const Color lightInputFill = Color(0XFFF7F7F7);
  static const Color lightBorder = Color(0XFF9196A3);
  static const Color lightFocuseBorder = Colors.brown;

  //Dight Theme Colors
  static const Color darkText = Colors.white;
  static const Color darkHint = Color(0XFF9196A3);
  static const Color darkInputFill = Color(0XFF303030);
  static const Color darkBorder = Color(0XFF9196A3);
  static const Color darkFocuseBorder = Colors.brown;
  static const Color darkButton = Color(0XFF5D4037);
}
