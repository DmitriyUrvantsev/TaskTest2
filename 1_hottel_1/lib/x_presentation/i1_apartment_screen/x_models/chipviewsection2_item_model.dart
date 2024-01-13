
/// This class is used in the [chipviewsection2_item_widget] screen.
class Chipviewsection2ItemModel {
  Chipviewsection2ItemModel({
    this.widget,
    this.isSelected,
  }) {
    widget = widget ?? "Только завтра или ужин";
    isSelected = isSelected ?? false;
  }

  String? widget;

  bool? isSelected;
}
