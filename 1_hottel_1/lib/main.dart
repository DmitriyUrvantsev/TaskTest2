import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_theme/theme.dart';

// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'core/app_export.dart';
// import 'core/utils/navigator_service.dart';
// import 'core/utils/pref_utils.dart';
// import 'core/utils/size_utils.dart';
// import 'localization/app_localization.dart';
// import 'routes/app_routes.dart';
// import 'theme/theme_helper.dart';
//======
//var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();//!для обработки ошибок
void main() {
  WidgetsFlutterBinding.ensureInitialized(); //!для асинхронности
  // Future.wait([
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]),
  //   PrefUtils().init()
  // ]).then((value) {
  runApp(const MyApp());
  //});
}

class MyApp extends StatelessWidget {
  //final MyAppModel model;
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
            // ThemeData(
            //   appBarTheme:
            //       const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //       backgroundColor: AppColors.mainDarkBlue,
            //       selectedItemColor: Colors.white,
            //       unselectedItemColor: Colors.grey.shade700),
            // ),

            // localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale('ru', 'RU'),
            //   Locale('en', 'US'),
            // ],
            routes: mainNavigation.routes,
            initialRoute: mainNavigation.initialRoute,
            onGenerateRoute: mainNavigation.onGenerateRoutes);
      },
    );
  }
}

//!-----------------------------------------------------------
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return ChangeNotifierProvider(
//           create: (context) => ThemeProvider(),
//           child: Consumer<ThemeProvider>(
//             builder: (context, provider, child) {
//               return MaterialApp(
//                 theme: theme,
//                 title: 'urvandimon_s_hotell',
//                 navigatorKey: NavigatorService.navigatorKey,
//                 debugShowCheckedModeBanner: false,
//                 localizationsDelegates: [
//                   AppLocalizationDelegate(),
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate,
//                 ],
//                 supportedLocales: const [
//                   Locale(
//                     'en',
//                     '',
//                   ),
//                 ],
//                 initialRoute: AppRoutes.initialRoute,
//                 routes: AppRoutes.routes,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
