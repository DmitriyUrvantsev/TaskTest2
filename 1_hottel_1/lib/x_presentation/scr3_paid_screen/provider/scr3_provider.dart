import 'package:flutter/material.dart';
import 'package:hottel_1/x_routes/app_routes.dart';

// ignore_for_file: must_be_immutable
class Screen3Provider extends ChangeNotifier {
  void popBack(context) {
    Navigator.popAndPushNamed(context, AppNavigationRoutes.hotel);
  }
}
