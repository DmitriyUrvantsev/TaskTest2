// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_floating_text_field.dart';
import 'package:hottel_1/x_widgets/custom_icon_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:hottel_1/x_widgets/custom_text_form_field.dart';

class AboutTourist extends StatelessWidget {
  const AboutTourist({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<Screen2Provider>();
    return Container(
      decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
          color: PrimaryColors().gray100),
      height: watch.sizeListView,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      
        itemCount: watch.hideTourist.length,
        itemBuilder: (BuildContext context, int index) {
          
          return Column(
            children: [
              AboutTourisItem(
                index: index,
              ),
              SizedBox(height: 8.v),
            ],
          );
        },
      ),
    );
  }
}

class AboutTourisItem extends StatelessWidget {
  final int index;
  AboutTourisItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen2Provider>();
    final watch = context.watch<Screen2Provider>();
    bool hideTourist = watch.hideTourist[index];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 4.v),
                child: Text('${read.touristNumber[index]} турист',
                    style: basicTheme().textTheme.titleLarge)),
            CustomIconButton(
                height: 32.dp,
                width: 32.dp,
                padding: EdgeInsets.all(10.h),
                onTap: () {
                  read.toggleShowTourist(index);
                },
                child: CustomImageView(
                  imagePath: hideTourist
                      ? ImageConstant.imgArrowRightPrimary6x12
                      : ImageConstant.imgArrowRightPrimary32x32,
                  color: basicTheme().primaryColor,
                ))
          ]),
          Column(
            children: [
              hideTourist
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        SizedBox(height: 17.v),
                        _buildFirstName(context, index),
                        SizedBox(height: 8.v),
                        _buildLastName(context),
                        SizedBox(height: 8.v),
                        _buildBirthDate(context),
                        SizedBox(height: 8.v),
                        _buildNationality(context),
                        SizedBox(height: 8.v),
                        _buildPassportNumber(context),
                        SizedBox(height: 8.v),
                        _buildPassportExpiry(context),
                        SizedBox(height: 3.v)
                      ],
                    )
            ],
          ),
        ],
      ),
    );
  }
}

/// Section Widget Имя
Widget _buildFirstName(BuildContext context, int index) {
  return CustomFloatingTextField(
      
      labelText: "Имя",
      validator: (val) => val?.isEmpty ?? false ? 'Введите имя' : null,
      labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
      hintText: "Иван");
}

/// Section Widget Фамилия
Widget _buildLastName(BuildContext context) {
  return CustomFloatingTextField(
      
      labelText: "Фамилия",
      validator: (val) =>
          val?.isEmpty ?? false ? 'Введите Фамилию' : null,
      labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
      hintText: "Иванов");
}

/// Section Widget День родения
Widget _buildBirthDate(BuildContext context) {
  return CustomTextFormField(
     
      validator: (val) =>
          val?.isEmpty ?? false ? 'Введите день рождения' : null,
      textStyle: CustomTextStyles.bodyLargeOnPrimary,
      hintText: "Дата рождения");
}

/// Section Widget Гражданство
Widget _buildNationality(BuildContext context) {
  return CustomTextFormField(
      
      validator: (val) =>
          val?.isEmpty ?? false ? 'Введите гражданство' : null,
      textStyle: CustomTextStyles.bodyLargeOnPrimary,
      hintText: "Гражданство");
}

/// Section Widget Загранпаспорт
Widget _buildPassportNumber(BuildContext context) {
  return CustomTextFormField(

      validator: (val) =>
          val?.isEmpty ?? false ? 'Введите номер загранпаспорта' : null,
      textStyle: CustomTextStyles.bodyLargeOnPrimary,
      hintText: "Номер загранпаспорта");
}

/// Section Widget Срок действия загранпаспорта
Widget _buildPassportExpiry(BuildContext context) {
  return CustomTextFormField(
    
    hintText: "Срок действия загранпаспорта",
    validator: (val) => val?.isEmpty ?? false
        ? 'Введите гражданство срок действия'
        : null,
    textStyle: CustomTextStyles.bodyLargeOnPrimary,
  );
}
