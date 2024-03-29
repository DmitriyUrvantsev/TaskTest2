import 'package:flutter/material.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/scr1_screens/scr1_apartment_screen.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_provider/scr1_provider.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/scr2_reservation_screen.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_presentation/scr3_paid_screen/provider/scr3_provider.dart';
import 'package:hottel_1/x_presentation/scr3_paid_screen/scr3_paid_screen.dart';
import 'package:provider/provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/scr0_screens/scr0_hotel_screen.dart';
import '../x_presentation/i0_hotel_screen/provider/i0_provider.dart';

abstract class AppNavigationRoutes {
  static const hotel = '/';
  static const apartmentScreen = '/apartment';
  static const reservationScreen = '/apartment/reservationScreen';
  static const paidScreen = '/apartment/reservationScreen/paidScreen';
}

class MainNavigation {


  final initialRoute = AppNavigationRoutes.hotel;

  final routes = <String, Widget Function(BuildContext)>{
    AppNavigationRoutes.hotel: (context) => ChangeNotifierProvider(
        create: (context) => Screen0Provider(), child: const HotelScreen()),

        
  };





//----------------наша функция где можно передать arg ---------------------------------
  Route<Object> onGenerateRoutes(RouteSettings settings) {
    //! в main добавить!!!!!!!!!!

    switch (settings.name) {
      case AppNavigationRoutes.apartmentScreen:
        final nameHotel = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => Screen1Provider(),
              child: ApartmentScreen(
                    nameHotel: nameHotel,
                  ),
            ));
      //----------------//
      case AppNavigationRoutes.reservationScreen:
        final arguments = settings.arguments;
        final apartmentID = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
               create: (context) => Screen2Provider(),
              child: ReservationScreen(
                    apartmentID: apartmentID,
                  ),
            ));
 //----------------//
            case AppNavigationRoutes.paidScreen:
        final arguments = settings.arguments;
        final apartmentID = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => Screen3Provider(),
              child: PaidScreen(
                    apartmentID: apartmentID,
                  ),
            ));
      default:
        const widget = Text('Navigation Error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
