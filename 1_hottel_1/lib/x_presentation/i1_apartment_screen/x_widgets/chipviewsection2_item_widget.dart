
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/chipviewsection2_item_model.dart';
import 'package:hottel_1/x_theme/theme.dart';


// ignore: must_be_immutable
class Chipviewsection2ItemWidget extends StatelessWidget {
  Chipviewsection2ItemWidget(
    this.chipviewsection2ItemModelObj, {
    Key? key,
    this.onSelectedChipView2,
  }) : super(
          key: key,
        );

  Chipviewsection2ItemModel chipviewsection2ItemModelObj;

  Function(bool)? onSelectedChipView2;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewsection2ItemModelObj.widget!,
        style: TextStyle(
          color: (chipviewsection2ItemModelObj.isSelected ?? false)
              ? basicTheme().colorScheme.primary
              : basicTheme().colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (chipviewsection2ItemModelObj.isSelected ?? false),
      backgroundColor: PrimaryColors().gray50,
      selectedColor: basicTheme().colorScheme.primary.withOpacity(0.1),
      shape: (chipviewsection2ItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                5.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                5.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView2?.call(value);
      },
    );
  }
}
