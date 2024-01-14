import 'package:flutter/material.dart';
import 'package:hottel_1/x_data/apartment.dart';
import 'package:hottel_1/x_data/apartment_data.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_models/scr2_model.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_servises/api_client.dart';

/// A provider class for the Scr2_Screen.
///
/// This provider manages the state of the K2Screen, including the
/// current k2ModelObj

// ignore_for_file: must_be_immutable
class Screen2Provider extends ChangeNotifier {
  final _apiClient = ApiClient();
  ApartmentData? _apartmentData;
  ApartmentData? get apartmentData => _apartmentData;

  // bool _hideTourist = false;
  // bool get hideTourist => _hideTourist;

  List<bool> _hideTourist = [false, true];
  List<bool> get hideTourist => _hideTourist;
  final List<String> touristNumber = Screen2Model().touristNumber;
  double sizeListView = 560;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportExpiryController = TextEditingController();

  Screen2Model scr2ModelObj = Screen2Model();

  Screen2Provider() {
    loadApartmentData();
  }

  Future<void> loadApartmentData() async {
    try {
      _apartmentData = await _apiClient.getApartmentDataPost();
      notifyListeners();
    } catch (e) {}
  }

  void toggleShowTourist(index) {
    _hideTourist[index] = !_hideTourist[index];
    if (_hideTourist[index] == true) {
      sizeListView = sizeListView - 418;
    } else {
      sizeListView = sizeListView + 418;
    }
    //print(_hideTourist);
    notifyListeners();
  }

  void addNewTourist() {
    _hideTourist.add(false);
    sizeListView = sizeListView + 418 + 75;
    notifyListeners();
  }

  void showPaidScreenScreen(context) {
    Navigator.of(context)
        .pushNamed(AppNavigationRoutes.paidScreen); //, arguments: apartmentID);
  }

  void onTapBack(context) {
    Navigator.pop(context);
  }

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
}
