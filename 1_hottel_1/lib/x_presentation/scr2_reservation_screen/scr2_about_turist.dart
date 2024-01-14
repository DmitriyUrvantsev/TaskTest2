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
    final read = context.read<Screen2Provider>();
    final watch = context.watch<Screen2Provider>();
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
          color: PrimaryColors().gray100),
      height: watch.sizeListView,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //padding: const EdgeInsets.only(top: 65),
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: 2,
        //itemExtent: 162,
        itemBuilder: (BuildContext context, int index) {
          // watch.showedMovieAtIndex(index);
          // final movie = watch.listMovies[index];
          // final posterPath = watch.listMovies[index]?.poster_path;
          // final relisDate = movie?.release_date;
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
  const AboutTourisItem({
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
                height: 32.adaptSize,
                width: 32.adaptSize,
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
                        _buildFirstName(context),
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

/// Section Widget
Widget _buildFirstName(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.firstNameController,
      builder: (context, firstNameController, child) {
        return CustomFloatingTextField(
            controller: firstNameController,
            labelText: "Имя",
            labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
            hintText: "Иван");
      });
}

/// Section Widget
Widget _buildLastName(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.lastNameController,
      builder: (context, lastNameController, child) {
        return CustomFloatingTextField(
            controller: lastNameController,
            labelText: "Фамилия",
            labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
            hintText: "Иванов");
      });
}

/// Section Widget
Widget _buildBirthDate(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.birthDateController,
      builder: (context, birthDateController, child) {
        return CustomTextFormField(
            controller: birthDateController, hintText: "Дата рождения");
      });
}

/// Section Widget
Widget _buildNationality(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.nationalityController,
      builder: (context, nationalityController, child) {
        return CustomTextFormField(
            controller: nationalityController, hintText: "Гражданство");
      });
}

/// Section Widget
Widget _buildPassportNumber(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.passportNumberController,
      builder: (context, passportNumberController, child) {
        return CustomTextFormField(
            controller: passportNumberController,
            hintText: "Номер загранпаспорта");
      });
}

/// Section Widget
Widget _buildPassportExpiry(BuildContext context) {
  return Selector<Screen2Provider, TextEditingController?>(
      selector: (context, provider) => provider.passportExpiryController,
      builder: (context, passportExpiryController, child) {
        return CustomTextFormField(
            controller: passportExpiryController,
            hintText: "Срок действия загранпаспорта",
            textInputAction: TextInputAction.done);
      });
}
