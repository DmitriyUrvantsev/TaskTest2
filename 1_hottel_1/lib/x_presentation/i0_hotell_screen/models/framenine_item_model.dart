
/// This class is used in the [framenine_item_widget] screen.
class FramenineItemModel {
  FramenineItemModel({
    this.widget,
    this.isSelected,
  }) {
    widget = widget ?? "3-я линия";
    isSelected = isSelected ?? false;
  }

  String? widget;

  bool? isSelected;
}
