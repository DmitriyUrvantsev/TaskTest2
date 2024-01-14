import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/chipviewsection_item_model.dart';
import 'package:hottel_1/x_theme/theme.dart';

// ignore: must_be_immutable
class ConditionItemWidget extends StatelessWidget {
  ConditionItemWidget(
    this.framenineItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  String? framenineItemModelObj;

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
        framenineItemModelObj ?? '',
        style: TextStyle(
          color: basicTheme().colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: PrimaryColors().gray50,
      selectedColor: PrimaryColors().gray50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: PrimaryColors().whiteA700,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          5.h,
        ),
      ),
      onSelected: (value) {
        //====== не нужно пока
      },
    );
  }
}
