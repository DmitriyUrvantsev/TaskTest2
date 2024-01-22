import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/scr3_paid_screen/provider/scr3_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:hottel_1/x_widgets/x_app_bar/appbar_title.dart';
import 'package:hottel_1/x_widgets/x_app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PaidScreen extends StatelessWidget {
  int apartmentID;
  PaidScreen({
    Key? key,
    required this.apartmentID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaidScreenBody(apartmentID: apartmentID);
  }
}

class PaidScreenBody extends StatelessWidget {
  const PaidScreenBody({super.key, required this.apartmentID});

  final int apartmentID;

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen3Provider>();
    return Scaffold(
        backgroundColor: PrimaryColors().whiteA700,
        appBar: _appBar(context, read),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 29.h, top: 122.v, right: 29.h),
            child: Column(children: [
              Container(
                  height: 94.dp,
                  width: 94.dp,
                  padding: EdgeInsets.all(25.h),
                  decoration: AppDecoration.fillGray
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder47),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgPartyPopper,
                      height: 44.dp,
                      width: 44.dp,
                      alignment: Alignment.center)),
              SizedBox(height: 33.v),
              Text('Ваш заказ принят в работу',
                  style: basicTheme().textTheme.titleLarge),
              SizedBox(height: 16.v),
              SizedBox(
                  width: 315.h,
                  child: Text(
                      "Подтверждение заказа №104893(apartmentID - $apartmentID) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: basicTheme()
                          .textTheme
                          .bodyLarge!
                          .copyWith(height: 1.20))),
              SizedBox(height: 5.v)
            ])),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 28.v),
            decoration: AppDecoration.outlineGray,
            child: CustomElevatedButton(
                text: 'Супер!', onPressed: () => read.popBack(context))));
  }

//!=============================================================================
  /// Section Widget
  PreferredSizeWidget _appBar(BuildContext context, read) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingCircleimage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 11.v),
            onTap: () {
              read.popBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: 'Заказ оплачен'),
        styleType: Style.bgFill);
  }
}
