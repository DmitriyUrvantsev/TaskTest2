import 'package:flutter/material.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_models/scr2_model.dart';
import 'package:hottel_1/x_routes/app_routes.dart';



/// A provider class for the Scr2_Screen.
///
/// This provider manages the state of the K2Screen, including the
/// current k2ModelObj

// ignore_for_file: must_be_immutable
class Screen2Provider extends ChangeNotifier {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportExpiryController = TextEditingController();

  Screen2Model scr2ModelObj = Screen2Model();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    birthDateController.dispose();
    nationalityController.dispose();
    passportNumberController.dispose();
    passportExpiryController.dispose();
  }

   void showPaidScreenScreen(context){
     Navigator.of(context)
        .pushNamed(AppNavigationRoutes.paidScreen);//, arguments: apartmentID);
  }

  void onTapBack(context) {
    Navigator.pop(context);
  }
}
