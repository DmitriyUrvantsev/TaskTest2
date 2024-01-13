import 'package:flutter/material.dart';
import 'package:hottel_1/x_data/hotel.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/models/i0_model.dart';
import 'package:hottel_1/x_routes/app_routes.dart';
import 'package:hottel_1/x_servises/api_client.dart';

// ignore_for_file: must_be_immutable
class I0Provider extends ChangeNotifier {
  final _apiClient = ApiClient();
  Hotel? _hotel;
  Hotel? get hotel => _hotel;

  I0Model k0ModelObj = I0Model();
  int sliderIndex = 0;

  I0Provider() {
    loadHotelData();
  }

//!=======================================================
  Future<void> loadHotelData() async {
    try {
      _hotel = await _apiClient.getHotelPost();

      notifyListeners();
    } catch (e) {}
  }

//------------------------
  void changeSliderIndex(index) {
    if (sliderIndex != index) {
      sliderIndex = index;
    }
    notifyListeners();
  }
//------------------------

//------------------------
  void showApartmenScreen(context, nameHotel) async {
    
    Navigator.of(context)
        .pushNamed(AppNavigationRoutes.apartmentScreen, arguments: nameHotel);
  }
//------------------------
}
