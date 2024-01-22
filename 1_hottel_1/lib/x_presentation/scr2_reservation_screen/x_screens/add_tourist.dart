import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_icon_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class AddTourist extends StatelessWidget {
  const AddTourist({super.key});

  @override
  Widget build(BuildContext context) {
        final read = context.read<Screen2Provider>();

    return  Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 13.dp),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.dp),
              child: Text("Добавить туриста",
                  style: basicTheme().textTheme.titleLarge)),
          CustomIconButton(
              onTap: () {
                read.addNewTourist();
              },
              height: 32.dp,
              width: 32.dp,
              padding: EdgeInsets.all(4.dp),
              decoration: IconButtonStyleHelper.fillPrimaryTL6,
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame609,
                color: PrimaryColors().whiteA700,
              ))
        ]));
  }

}