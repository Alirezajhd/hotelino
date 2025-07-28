import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  ThemeProvider(this._brightness);

  Brightness get brightness => _brightness;

  void updateBrightness(Brightness brightness) {
    _brightness = brightness;
    _updateSystemUi();
    notifyListeners();
  }

  void togleBrightness() {
    _brightness =
        (brightness == Brightness.light) ? Brightness.dark : Brightness.light;
    _updateSystemUi();
    notifyListeners();
  }

  void _updateSystemUi() {
    bool isDark = _brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
