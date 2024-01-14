
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_models/one_item_model.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';


// ignore: must_be_immutable
class OneItemWidget extends StatelessWidget {
  OneItemWidget(
    this.oneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OneItemModel oneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: ImageConstant.imgImage20257x343,
        height: 257.v,
        width: 343.h,
        radius: BorderRadius.circular(
          15.h,
        ),
      ),
    );
  }
}
