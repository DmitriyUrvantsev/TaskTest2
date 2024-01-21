
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_core/x_utils/x%20_pref_utils.dart%2020-17-13-099.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_theme/x_provider/theme_provider.dart';
//import 'package:hottel_1/x_theme/x_provider/theme_provider.dart';
import 'package:provider/provider.dart';




 void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()//!======================= из новой
  ]).then((value) {
    runApp(MyApp());
  });
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

//!=============================================================================

// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FlutterSizer(
//       builder: (context, orientation, screenType) {
//         return MaterialApp(
//             title: 'Flutter Sizer Example',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: Home());
//       },
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 150.dp,
//             //Adaptive.h(12.5), // or 12.5.h
//             width: 150.dp, // or Adaptive.w(50)
//             color: Colors.black,
//           ),
//           Text(
//             "Resolution is -> ${100.0.w}x${100.0.h}",
//           ),
//           Text(
//             "This text is responsive 12dp -> ${12.0.dp}",
//             style: TextStyle(fontSize: 12.0.dp), // or Adaptive.sp(12)
//           ),
//           Text(
//             "This text is responsive 24dp -> ${24.0.dp}",
//             style: TextStyle(fontSize: 24.0.dp), // or Adaptive.sp(12)
//           ),
//           Device.orientation == Orientation.portrait
//               ? Text("My Orientation is Portrait")
//               : Text("My Orientation is Landscape"),
//           Device.screenType == ScreenType.tablet
//               ? Text("My Screen's Type is a Tablet")
//               : Text("My Screen's Type is a Phone")
//         ],
//       )),
//     );
//   }
// }
