import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_provider/scr1_provider.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/button_condition_widget.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/condition_item_widget.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:provider/provider.dart';

class RoomDataWidget extends StatelessWidget {
  final int index;
  const RoomDataWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen1Provider>();
    final indexRooms = index;
    return Container(
        width: Device.width,
        margin: EdgeInsets.only(right: 5.dp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameSection(read, indexRooms),
            SizedBox(height: 4.dp),
            _conditionsSection(context, indexRooms, read), //!++++++++
            ButtonConditionWidget('Подробнее о номере'),
            SizedBox(height: 16.dp),
            _priceRowSection(context,
                priceText: '${read.apartment?.rooms?[indexRooms].price} ₽',
                title: '${read.apartment!.rooms![indexRooms].pricePer!}'),
          ],
        ));
  }

  /// Section Наименование номера================================================
  Text _nameSection(Screen1Provider read, int indexRooms) {
    return Text(read.apartment?.rooms?[indexRooms].name ?? '', //!наименование
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: basicTheme().textTheme.titleLarge!.copyWith(height: 1.20));
  }

  /// Section все вкючено=======================================================
  Widget _conditionsSection(BuildContext context, indexRooms, read) {
    return Consumer<Screen1Provider>(builder: (context, provider, child) {
      return Wrap(
          //runSpacing: 2.dp,
          spacing: 8.dp,
          children: List<Widget>.generate(
              read.apartment?.rooms?[indexRooms].peculiarities?.length ??
                  0, //!====
              (i) {
            String? model =
                read.apartment?.rooms?[indexRooms].peculiarities?[i];
            return ConditionItemWidget(model);
          }));
    });
  }

  /// Common widget
  Widget _priceRowSection(
    BuildContext context, {
    required String priceText,
    required String title,
  }) {
    return Row(children: [
      Text(priceText,
          style: basicTheme().textTheme.headlineLarge!.copyWith(
              color:
                  basicTheme().colorScheme.secondaryContainer.withOpacity(1))),
      Padding(
          padding: EdgeInsets.only(left: 9.dp, top: 14.dp, bottom: 3.dp),
          child: Builder(builder: (context) {
            return Text(title,
                style: basicTheme().textTheme.bodyLarge!.copyWith(
                    fontSize: 18,
                    color: basicTheme()
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(1)));
          }))
    ]);
  }
}
