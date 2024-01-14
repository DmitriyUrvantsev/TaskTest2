
/// This class is used in the [chipviewsection_item_widget] screen.
class ChipviewsectionItemModel {
  ChipviewsectionItemModel({
    this.widget,
    this.isSelected,
  }) {
    widget = widget ?? "Все включено";
    isSelected = isSelected ?? false;
  }

  String? widget;

  bool? isSelected;
}
