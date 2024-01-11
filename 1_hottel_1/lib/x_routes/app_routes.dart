import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/hotell_screen.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/i1_apartment_screen.dart';
import '../x_presentation/i0_hotell_screen/provider/i0_provider.dart';


abstract class AppNavigationRoutes {
  static const hotell = '/';
  static const apartmentScreen = '/apartment';
  static const reservationScreen = '/apartment/reservationScreen';
  static const paidScreen = '/apartment/reservationScreen/paidScreen';
}

class MainNavigation {
  // String initialRoute(bool isAuth) => isAuth
  //     ? AppNavigationRoutes.hotell
  //     : AppNavigationRoutes.hotell;

final initialRoute = AppNavigationRoutes.hotell;

  final routes = <String, Widget Function(BuildContext)>{
    AppNavigationRoutes.hotell: (context) => ChangeNotifierProvider(
      create: (context) => K0Provider(),
    child: const HotellScreen()),
  };

//----------------наша функция где можно передать arg ---------------------------------
  Route<Object> onGenerateRoutes(RouteSettings settings) {
    //! в main добавить!!!!!!!!!!

    switch (settings.name) {
      case AppNavigationRoutes.apartmentScreen:
       // final movieId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => ApartmentScreen(
                 // movieId: movieId,
                ));
      //----------------//
      // case AppNavigationRoutes.movieScreenDetailsTrailer:
      //   final arguments = settings.arguments;
      //   final youTubeKey = arguments is String ? arguments : '0';
      //   return MaterialPageRoute(
      //       builder: (context) => MovieDetailsTrailerWidget(
      //             youTubeKey: youTubeKey,
      //           ));
      default:
        const widget = Text('Navigation Error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
