import 'package:flutter/material.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/models/i0_model.dart';

/// A provider class for the K0Screen.
///
/// This provider manages the state of the K0Screen, including the
/// current k0ModelObj

// ignore_for_file: must_be_immutable
class K0Provider extends ChangeNotifier {
  I0Model k0ModelObj = I0Model();

  int sliderIndex = 3;


  void changeSliderIndex(index) {
    if (sliderIndex != index) {
      sliderIndex = index;
    }
    notifyListeners();
  }

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
