import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
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
    return SizedBox(
      height: 29.dp,
      child: RawChip(
        // padding: EdgeInsets.symmetric(
        //     //horizontal: 10.dp,
        //     //vertical: 4.dp,
        //     ),

        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          framenineItemModelObj ?? '',
          style: TextStyle(
            color: basicTheme().colorScheme.onPrimaryContainer.withOpacity(1),
            fontSize: 16.dp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: PrimaryColors().gray50,
        selectedColor: PrimaryColors().gray50,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: PrimaryColors().whiteA700,
            width: 1.dp,
          ),
          borderRadius: BorderRadius.circular(
            5.dp,
          ),
        ),
        onSelected: (value) {
          //====== не нужно пока
        },
      ),
    );
  }
}
