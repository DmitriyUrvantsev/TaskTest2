import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_theme/x_provider/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

    runApp(MyApp());

}



class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: Consumer(
            builder: (BuildContext context, provider, Widget? child) {
              return HotelAppWidget();
            },
          ),
        );
      },
    );
  }
}

class HotelAppWidget extends StatelessWidget {
  const HotelAppWidget({
    super.key,
    
  });

    static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hottel App',
        debugShowCheckedModeBanner: false,
        theme: basicTheme(),
        routes: mainNavigation.routes,
        initialRoute: mainNavigation.initialRoute,
        onGenerateRoute: mainNavigation.onGenerateRoutes);
  }
}
