// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/about_hotel.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/departure_data.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_screens/scr2_about_turist.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/custom_floating_text_field.dart';
import 'package:hottel_1/x_widgets/custom_icon_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
//import 'package:hottel_1/x_widgets/custom_text_form_field.dart';
import 'package:hottel_1/x_widgets/x_app_bar/appbar_title.dart';
import 'package:hottel_1/x_widgets/x_app_bar/custom_app_bar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
        appBar: _buildAppBar(context, read),
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
                          AboutHotel(),
                          SizedBox(height: 8.v),
                          DepartureData(),
                          SizedBox(height: 8.v),
                          _buildBuyerInfo(context),
                          SizedBox(height: 8.v),
                          AboutTourist(),
                          SizedBox(height: 8.v),
                          _buildFour(context),
                          SizedBox(height: 8.v),
                          _buildForPaid(context)
                        ]))),
              ))
            ])),
        bottomNavigationBar: _buildBarsBars(context));
  }

  //===========================================================================
  //===========================================================================
  //===========================================================================
  /// Section Widget AppBar
  PreferredSizeWidget _buildAppBar(BuildContext context, read) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingCircleimage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 11.v),
            onTap: () {
              read.onTapBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: 'Бронирование'),
        styleType: Style.bgFill);
  }

  
  /// Section Widget

  Widget _buildPhoneNumber(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '(###) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return CustomFloatingTextField(
      validator: (val) => val != null
          ? (val.length < 15 ? 'Введите номер телефона' : null)
          : null,

      labelText: 'Номер телефона',
      labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
      hintText: '(***) ***-**-**',
      prefixText: '+7',
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        maskFormatter
      ],
      //maskInput:
    );
  }

  /// Section TextField Почта
  Widget _buildEmail(BuildContext context) {
    return CustomFloatingTextField(
        labelText: "Почта",
        validator: (val) => read.validateEmail(val),
        //  (val) => val != null
        //     ? (val.length < 3 ? 'Введите почту' : null)
        //     : null,
        labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
        hintText: 'examplemail.000@mail.ru');
  }

  /// Section Widget инфа о Покупателе
  Widget _buildBuyerInfo(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text('Информация о покупателе',
                  style: basicTheme().textTheme.titleLarge),
              SizedBox(height: 17.v),
              _buildPhoneNumber(context),
              SizedBox(height: 8.v),
              _buildEmail(context),
              SizedBox(height: 7.v),
              Container(
                  width: 331.h,
                  margin: EdgeInsets.only(right: 11.h),
                  child: Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: basicTheme()
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.20)))
            ]));
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text("Добавить туриста",
                  style: basicTheme().textTheme.titleLarge)),
          CustomIconButton(
              onTap: () {
                read.addNewTourist();
              },
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.all(4.h),
              decoration: IconButtonStyleHelper.fillPrimaryTL6,
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame609,
                color: PrimaryColors().whiteA700,
              ))
        ]));
  }

  /// Section Widget
  Widget _buildForPaid(BuildContext context) {
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

  /// Section Widget
  Widget _buildButtonPaid(BuildContext context) {
    //!!!!!!!!! переделать в моделе с учетом колва туристов !!!!!!!!!!!!!!!!!!!
    return CustomElevatedButton(
        onPressed: () {
          read.showPaidScreenScreen(context, apartmentID);
        },
        text:
            'Оплатить ${(read.apartmentData?.tourPrice as int) + (read.apartmentData?.fuelCharge as int) + (read.apartmentData?.serviceCharge as int)} ₽');
  }

  /// Section Widget
  Widget _buildBarsBars(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 28.v),
        decoration: AppDecoration.outlineGray,
        child: _buildButtonPaid(context));
  }

  /// Common widget
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
}
