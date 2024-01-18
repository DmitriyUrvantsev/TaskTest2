import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hottel_1/x_core/x_utils/x%20_pref_utils.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_theme/x_provider/theme_provider.dart';
import 'package:provider/provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}



class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: Consumer(
            builder: (BuildContext context, provider, Widget? child) {
              return MaterialApp(
                  title: 'Hottel App',
                  debugShowCheckedModeBanner: false,
                  theme: basicTheme(),
                  routes: mainNavigation.routes,
                  initialRoute: mainNavigation.initialRoute,
                  onGenerateRoute: mainNavigation.onGenerateRoutes);
            },
          ),
        );
      },
    );
  }
}
