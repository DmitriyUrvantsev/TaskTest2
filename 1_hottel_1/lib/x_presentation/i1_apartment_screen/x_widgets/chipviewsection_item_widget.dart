
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/chipviewsection_item_model.dart';
import 'package:hottel_1/x_theme/theme.dart';

// ignore: must_be_immutable
class ChipviewsectionItemWidget extends StatelessWidget {
  ChipviewsectionItemWidget(
    this.chipviewsectionItemModelObj, {
    Key? key,
    this.onSelectedChipView1,
  }) : super(
          key: key,
        );

  ChipviewsectionItemModel chipviewsectionItemModelObj;

  Function(bool)? onSelectedChipView1;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 4.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewsectionItemModelObj.widget!,
        style: TextStyle(
          color: (chipviewsectionItemModelObj.isSelected ?? false)
              ? basicTheme().colorScheme.primary
              : basicTheme().colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (chipviewsectionItemModelObj.isSelected ?? false),
      backgroundColor: PrimaryColors().gray50,
      selectedColor: basicTheme().colorScheme.primary.withOpacity(0.1),
      shape: (chipviewsectionItemModelObj.isSelected ?? false)
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
        onSelectedChipView1?.call(value);
      },
    );
  }
}
