import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/models/three_item_model.dart';
import '../../../x_core/x_utils/image_constant.dart';
import '../../../x_widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ThreeItemWidget extends StatelessWidget {
  ThreeItemWidget(
    this.threeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThreeItemModel threeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: ImageConstant.imgImage20,
        height: 257.v,
        width: 343.h,
        radius: BorderRadius.circular(
          15.h,
        ),
      ),
    );
  }
}
