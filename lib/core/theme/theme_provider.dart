import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  ThemeProvider(this._brightness);

  Brightness get brightness => _brightness;

  void updateBrightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }

  void togleBrightness() {
    _brightness =
        (brightness == Brightness.light) ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}
