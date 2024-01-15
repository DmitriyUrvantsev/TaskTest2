import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_theme/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); //!для асинхронности
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
 
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            title: 'Hottel App',
            debugShowCheckedModeBanner: false,
            theme: basicTheme(),
                     routes: mainNavigation.routes,
            initialRoute: mainNavigation.initialRoute,
            onGenerateRoute: mainNavigation.onGenerateRoutes);
      },
    );
  }
}
