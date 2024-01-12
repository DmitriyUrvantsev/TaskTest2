import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/models/discription_item_model.dart';
import 'package:hottel_1/x_theme/theme.dart';

// ignore: must_be_immutable
class DiscriptionItemWidget extends StatelessWidget {
  DiscriptionItemWidget(
    this.framenineItemModelObj, {
    Key? key,
    this.onSelectedChipView1,
  }) : super(
          key: key,
        );

  DiscriptionItemModel framenineItemModelObj;

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
        framenineItemModelObj.widget!,
        style: TextStyle(
          color: basicTheme().colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (framenineItemModelObj.isSelected ?? false),
      backgroundColor: PrimaryColors().gray50,
      selectedColor: PrimaryColors().gray50,
      shape: (framenineItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: basicTheme()
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.6),
                width: 1.h,
              ),
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
