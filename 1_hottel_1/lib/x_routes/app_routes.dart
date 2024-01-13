import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/hotel_screen.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/i1_apartment_screen.dart';
import '../x_presentation/i0_hotel_screen/provider/i0_provider.dart';

abstract class AppNavigationRoutes {
  static const hotel = '/';
  static const apartmentScreen = '/apartment';
  static const reservationScreen = '/apartment/reservationScreen';
  static const paidScreen = '/apartment/reservationScreen/paidScreen';
}

class MainNavigation {
  // String initialRoute(bool isAuth) => isAuth
  //     ? AppNavigationRoutes.hotel
  //     : AppNavigationRoutes.hotel;

  final initialRoute = AppNavigationRoutes.hotel;

  final routes = <String, Widget Function(BuildContext)>{
    AppNavigationRoutes.hotel: (context) => ChangeNotifierProvider(
        create: (context) => I0Provider(), child: const HotelScreen()),
  };

//----------------наша функция где можно передать arg ---------------------------------
  Route<Object> onGenerateRoutes(RouteSettings settings) {
    //! в main добавить!!!!!!!!!!

    switch (settings.name) {
      case AppNavigationRoutes.apartmentScreen:
         final nameHotel = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ApartmentScreen(
                 nameHotel: nameHotel,
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
