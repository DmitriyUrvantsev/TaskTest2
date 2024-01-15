import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ButtonConditionWidget extends StatelessWidget {
  ButtonConditionWidget(
    this.about, {
    Key? key,
  }) : super(
          key: key,
        );

  String? about;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 4.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: SizedBox(
        width: 180.v,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$about',
              style: CustomTextStyles.titleSmallPrimary17,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              color: basicTheme().primaryColor,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(13, 114, 255, 0.1),
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
