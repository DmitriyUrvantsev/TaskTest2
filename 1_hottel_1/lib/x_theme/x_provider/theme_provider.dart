import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/x%20_pref_utils.dart%2020-17-13-099.dart';

class ThemeProvider extends ChangeNotifier {
  themeChange(String themeType) async {
    PrefUtils().setThemeData(themeType);
    notifyListeners();
  }



}
