import 'package:flutter/material.dart';
import 'package:hottel_1/x_data/hotel.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/models/i0_model.dart';
import 'package:hottel_1/x_servises/api_client.dart';

/// A provider class for the K0Screen.
///
/// This provider manages the state of the K0Screen, including the
/// current k0ModelObj

// ignore_for_file: must_be_immutable
class I0Provider extends ChangeNotifier {
  final _apiClient = ApiClient();
  Hotel? _hotel;
  Hotel? get hotel => _hotel;

  I0Model k0ModelObj = I0Model();
  int sliderIndex = 3;

  K0Provider() {
    loadHotelData();
    print(_hotel);
  }

//!=======================================================

//!-----------------------------
//!-----------------------------
  // void setupLocale(BuildContext context) {
  //   final locale = Localizations.localeOf(context).toLanguageTag();
  //   if (_locale == locale) return;
  //   _locale = locale;
  //   _dateFormat = DateFormat.yMd('en-US');
  //   loadMovieDetails();
  // }
// -----------------------

  Future<void> loadHotelData() async {
    try {
      _hotel = await _apiClient.getHotelPost();
     
      notifyListeners();
    } catch (e) {}

    // try {
    //   _hotel =
    //       await _apiClient.getMovieDetails(locale: _locale, movieId: movieId);
    //   //_checkFavorit();
    //   notifyListeners();
    // } on ApiClientExeption catch (e) {
    //   _handleApiClientExeption(e);
  }

  //!=======================================================

//----------------------
  void changeSliderIndex(index) {
    if (sliderIndex != index) {
      sliderIndex = index;
    }
    notifyListeners();
  }

//------------------------
  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    // print(index);
    k0ModelObj.framenineItemList.forEach((element) {
      element.isSelected = false;
    });
    k0ModelObj.framenineItemList[index].isSelected = value;
    notifyListeners();
  }
}
