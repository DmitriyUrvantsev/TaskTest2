// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/scr2_about_turist.dart';
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
                          //ValidTest(),
                          _buildHotel(context),
                          SizedBox(height: 8.v),
                          _buildDepartureData(context),
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

  /// Section Widget Hotel
  Widget _buildHotel(BuildContext context) {
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
                        height: 15.adaptSize,
                        width: 15.adaptSize,
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

//!======================================
              TextButton(
                onPressed: () {},
                child: Text('${read.apartmentData?.hotelAdress} ', //! адреc
                    maxLines: 1,
                    style: CustomTextStyles.titleSmallPrimary),
              ),
            ]));
  }

//!============================================================================
//!============================================================================
  /// Section Widget
  Widget _buildDepartureData(BuildContext context) {
    //!++++++====== надо переделать, Фигня с этими падингами
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 77.h),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text('Вылет из',
                            style: basicTheme().textTheme.bodyLarge)),
                    Padding(
                        padding: EdgeInsets.only(left: 76.h),
                        child: Text('${read.apartmentData?.departure} ',
                            style:
                                CustomTextStyles.bodyLargeSecondaryContainer))
                  ])),
              SizedBox(height: 14.v),
              Row(children: [
                Text("Страна, город", style: basicTheme().textTheme.bodyLarge),
                Padding(
                    padding: EdgeInsets.only(left: 36.h),
                    child: Text('${read.apartmentData?.arrivalCountry} ',
                        style: CustomTextStyles.bodyLargeSecondaryContainer))
              ]),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text('Даты',
                                style: basicTheme().textTheme.bodyLarge)),
                        Text(
                            '${read.apartmentData?.tourDateStart} - ${read.apartmentData?.tourDateStop}',
                            style: CustomTextStyles.bodyLargeSecondaryContainer)
                      ])),
              SizedBox(height: 13.v),
              Row(children: [
                Text("Кол-во ночей", style: basicTheme().textTheme.bodyLarge),
                Padding(
                    padding: EdgeInsets.only(left: 44.h),
                    child: Text('${read.apartmentData?.numberOfNights}',
                        style: CustomTextStyles.bodyLargeSecondaryContainer))
              ]),
              SizedBox(height: 15.v),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child:
                        Text('Отель', style: basicTheme().textTheme.bodyLarge)),
                Container(
                  margin: EdgeInsets.only(left: 102.h),
                  width: 190.v,
                  child: Text('${read.apartmentData?.hotelName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeSecondaryContainer),
                )
              ]),
              SizedBox(height: 13.v),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(top: 1.v, bottom: 19.v),
                    child:
                        Text("Номер", style: basicTheme().textTheme.bodyLarge)),
                Container(
                    width: 185.h,
                    margin: EdgeInsets.only(left: 96.h),
                    child: Text('${read.apartmentData?.room}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeSecondaryContainer
                            .copyWith(height: 1.20)))
              ]),
              SizedBox(height: 13.v),
              Row(children: [
                Text("Питание", style: basicTheme().textTheme.bodyLarge),
                Padding(
                    padding: EdgeInsets.only(left: 82.h),
                    child: Text('${read.apartmentData?.nutrition}',
                        style: CustomTextStyles.bodyLargeSecondaryContainer))
              ])
            ]));
  }
//!============================================================================
//!============================================================================

  /// Section Widget

  Widget _buildPhoneNumber(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '(###) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return Selector<Screen2Provider, TextEditingController?>(
        selector: (context, provider) => provider.phoneNumberController,
        builder: (context, phoneNumberController, child) {
          return CustomFloatingTextField(
            controller: phoneNumberController,
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
        });
  }

  /// Section TextField Почта
  Widget _buildEmail(BuildContext context) {
    return Selector<Screen2Provider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomFloatingTextField(
              controller: emailController,
              labelText: "Почта",
              validator: (val) => read.validateEmail(val),
              //  (val) => val != null
              //     ? (val.length < 3 ? 'Введите почту' : null)
              //     : null,
              labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
              hintText: 'examplemail.000@mail.ru');
        });
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

  /// Section Widget инфа о ВТОРОМ Туристе //!!======= дроп даун так же нужно и первого
  Widget _buildThree(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //=====================
          Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text("Второй турист",
                  style: basicTheme().textTheme.titleLarge)),
          //===================
          Container(
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
              decoration: AppDecoration.fillPrimary1
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowRightPrimary6x12,
                  color: basicTheme().primaryColor,
                  //color: basicTheme().primaryColor,
                  height: 6.v,
                  width: 12.h,
                  alignment: Alignment.bottomCenter))
          //===========================
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
          if (read.formKey.currentState?.validate() ?? false) {
            read.showPaidScreenScreen(context, apartmentID);
          }
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
