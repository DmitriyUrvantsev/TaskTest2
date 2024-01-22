// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/about_hotel.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/add_tourist.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/buyer_info.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/departure_data.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/about_turist.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/x_app_bar/appbar_title.dart';
import 'package:hottel_1/x_widgets/x_app_bar/custom_app_bar.dart';


// ignore: must_be_immutable
class ReservationScreen extends StatelessWidget {
  int apartmentID;
  ReservationScreen({
    Key? key,
    required this.apartmentID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen2Provider>();
    final watch = context.watch<Screen2Provider>();
    return Scaffold(
      body: watch.apartmentData == null
          ? Center(child: CircularProgressIndicator())
          : ReservationScreenBody(read: read, apartmentID: apartmentID),
    );
  }
}

class ReservationScreenBody extends StatelessWidget {
  const ReservationScreenBody({
    Key? key,
    required this.read,
    required this.apartmentID,
  }) : super(key: key);
  final int apartmentID;
  final Screen2Provider read;

  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(context, read),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 8.v),
              Expanded(
                  child: Form(
                key: read.formKey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          const AboutHotel(),
                          SizedBox(height: 8.v),
                          const DepartureData(),
                          SizedBox(height: 8.v),
                          const BuyerInfoSection(),
                          SizedBox(height: 8.v),
                          const AboutTourist(),
                          SizedBox(height: 8.v),
                          const AddTourist(),
                          SizedBox(height: 8.v),
                          _dataPaidSection(context)
                        ]))),
              ))
            ])),
        bottomNavigationBar: _buttonPaid(context));
  }

  //!===========================================================================
  //!=========================_appBar==================================================


  PreferredSizeWidget _appBar(BuildContext context, read) {
    final orientation = Device.orientation;
    return CustomAppBar(
      height: orientation == 'portrait' ? null : 45.dp,
      leadingWidth: 48.dp,
      leading: AppbarLeadingCircleimage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 16.dp, top: 14.dp, bottom: 11.dp),
          onTap: () {
            read.onTapBack(context);
          }),
      centerTitle: true,
      title: AppbarTitle(text: 'Бронирование'),
      styleType: Style.bgFill,
    );
  }

//!============================_dataPaidSection===============================================

  Widget _dataPaidSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //!!!!!!!!! переделать в моделе с учетом колва туристов !!!!!!!!!!!!!!!!!!!
          _buildSeven(context,
              titleText: "Тур", priceText: '${read.apartmentData?.tourPrice}'),
          SizedBox(height: 13.v),
          _buildSeven(context,
              titleText: "Топливный сбор",
              priceText: '${read.apartmentData?.fuelCharge}'),
          SizedBox(height: 13.v),
          _buildSeven(context,
              titleText: "Сервисный сбор",
              priceText: '${read.apartmentData?.serviceCharge}'),
          SizedBox(height: 13.v),
          _buildSeven(context,
              titleText: "К оплате",
              priceText:
                  '${(read.apartmentData?.tourPrice as int) + (read.apartmentData?.fuelCharge as int) + (read.apartmentData?.serviceCharge as int)} ₽')
        ]));
  }
//===============================================================================

  Widget _buildSeven(
    BuildContext context, {
    required String titleText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(titleText,
              style: basicTheme().textTheme.bodyLarge!.copyWith(
                  color: basicTheme()
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(1)))),
      Text(priceText,
          style: CustomTextStyles.bodyLargeSecondaryContainer.copyWith(
              color:
                  basicTheme().colorScheme.secondaryContainer.withOpacity(1)))
    ]);
  }


//!======================_buttonPaid=====================================================

  /// Section Widget
  Widget _buttonPaid(BuildContext context) {
    //=======
    final orientation = Device.orientation;
    return Container(
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 28.v),
      decoration: AppDecoration.outlineGray,
      child: CustomElevatedButton(
          height: orientation == 'portrait' ? null : 48.dp,
          onPressed: () {
            read.showPaidScreenScreen(context, apartmentID);
          },
          text:
              'Оплатить ${(read.apartmentData?.tourPrice as int) + (read.apartmentData?.fuelCharge as int) + (read.apartmentData?.serviceCharge as int)} ₽'),
    );
  }


}
