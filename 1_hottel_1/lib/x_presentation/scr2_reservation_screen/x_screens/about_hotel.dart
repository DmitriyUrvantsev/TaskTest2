import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class AboutHotel extends StatelessWidget {
  const AboutHotel({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen2Provider>();
    //final watch = context.watch<Screen2Provider>();
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
                  decoration: AppDecoration.fillAmberA
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgStar2215x15,
                        height: 15.dp,
                        width: 15.dp,
                        color: PrimaryColors().amberA700,
                        radius: BorderRadius.circular(1.h),
                        margin: EdgeInsets.symmetric(vertical: 3.v)),
                    Padding(
                        padding: EdgeInsets.only(left: 2.h, top: 2.v),
                        child: Text(
                            //!Превосходно
                            '${read.apartmentData?.horating} ${read.apartmentData?.ratingName}',
                            style: CustomTextStyles.titleMediumAmberA700))
                  ])),
              SizedBox(height: 9.v),
              Text('${read.apartmentData?.hotelName}', //!Название Отеля
                  style: basicTheme().textTheme.titleLarge),
              SizedBox(height: 6.v),
              TextButton(
                onPressed: () {},
                child: Text('${read.apartmentData?.hotelAdress} ', //! адреc
                    maxLines: 1,
                    style: CustomTextStyles.titleSmallPrimary),
              ),
            ]));
  }
}
