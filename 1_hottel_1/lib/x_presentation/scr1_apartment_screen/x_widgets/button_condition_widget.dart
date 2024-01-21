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
          //horizontal: 10.dp,
          //vertical: 4.dp,
          ),
      showCheckmark: false,
      labelPadding: EdgeInsets.symmetric(
        horizontal: 10.dp,
      ),
      label: SizedBox(
        width: 192.dp,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$about',
              style: CustomTextStyles.titleSmallPrimary17,
            ),
            Expanded(
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                color: basicTheme().primaryColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(13, 114, 255, 0.1),
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
    );
  }
}
