import 'one_item_model.dart';
import 'chipviewsection_item_model.dart';
import 'chipviewsection2_item_model.dart';

class Scr1Model {
  List<OneItemModel> oneItemList = List.generate(1, (index) => OneItemModel());

  List<ChipviewsectionItemModel> chipviewsectionItemList =
      List.generate(3, (index) => ChipviewsectionItemModel());

  List<Chipviewsection2ItemModel> chipviewsection2ItemList =
      List.generate(3, (index) => Chipviewsection2ItemModel());
}
