import 'package:flutter/material.dart';
import 'package:hottel_1/x_data/apartment.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/scr1_model.dart';
import 'package:hottel_1/x_servises/api_client.dart';

/// current k1ModelObj

// ignore_for_file: must_be_immutable
class Screen1Provider extends ChangeNotifier {
 
 
  final _apiClient = ApiClient();
  Apartment? _apartment;
  Apartment? get apartment => _apartment;

  Scr1Model scr1ModelObj = Scr1Model();
  int sliderIndex = 0;

  Screen1Provider() {
    loadApartmentData();
  }



//!=======================================================
  Future<void> loadApartmentData() async {
    try {
      _apartment = await _apiClient.getApartmentPost();
      print('функция -  ${_apartment?.rooms?.length}');
      notifyListeners();
    } catch (e) {}
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    scr1ModelObj.chipviewsectionItemList.forEach((element) {
      element.isSelected = false;
    });
    scr1ModelObj.chipviewsectionItemList[index].isSelected = value;
    notifyListeners();
  }

  void onSelectedChipView2(
    int index,
    bool value,
  ) {
    scr1ModelObj.chipviewsection2ItemList.forEach((element) {
      element.isSelected = false;
    });
    scr1ModelObj.chipviewsection2ItemList[index].isSelected = value;
    notifyListeners();
  }
}
