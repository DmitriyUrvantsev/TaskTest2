import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/widgets/discription_item_widget.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:provider/provider.dart';

class AboutHotelWidget extends StatelessWidget {
  const AboutHotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
        final read = context.read<Screen0Provider>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 15.dp),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
           ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Об отеле", style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 15.dp),
            _advantagesSection(read),
            SizedBox(height: 11.dp),
            _discriptionSection(read),
            SizedBox(height: 13.dp),
            _castomListTitle(context)
          ]));
}

//!=============================================================================
//!=============================================================================
//!==============================Преимущества Секция================================

  Consumer<Screen0Provider> _advantagesSection(Screen0Provider read) {
    return Consumer<Screen0Provider>(builder: (context, provider, child) {
            return Wrap(
                //runSpacing: 1.dp,
                spacing: 8.dp,
                children: List<Widget>.generate(
                    read.hotel?.aboutTheHotel?.peculiarities?.length ?? 0,
                    (index) {
                  //DiscriptionItemModel
                  String? model =
                      read.hotel?.aboutTheHotel?.peculiarities?[index];
                  return DiscriptionItemWidget(
                    model,
                    //! длина строк в API длинее чем в фигме и из-за этого в две строки не помещается
                    //?поэтому я сократил длинные строки до 15 символов
                  );
                }));
          });
  }


//!==============================Описание Секция================================
  SizedBox _discriptionSection(Screen0Provider read) {
    return SizedBox(
              width: Device.width,
              child: Text(
                  '${read.hotel?.aboutTheHotel?.description}', 
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyLargeSecondaryContainer_1
                      .copyWith(height: 1.20)));
  }


//!==============================CastomListTile=================================
  Container _castomListTitle(BuildContext context) {
    return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 15.dp, vertical: 14.dp),
              decoration: AppDecoration.fillGray50.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _castomListTitleBody(context,
                        checkmark: ImageConstant.imgSettings,
                        titleMediumOnSecondaryContainer: "Удобства",
                        titleSmall: "Самое необходимое"),
                    SizedBox(height: 9.dp),
                    Divider(indent: 38.dp),
                    SizedBox(height: 8.dp),
                    _castomListTitleBody(context,
                        checkmark: ImageConstant.imgCheckmark,
                        titleMediumOnSecondaryContainer: "Что включено",
                        titleSmall: "Самое необходимое"),
                    SizedBox(height: 9.dp),
                    Divider(indent: 38.dp),
                    SizedBox(height: 8.dp),
                    _castomListTitleBody(context,
                        checkmark: ImageConstant.imgClose,
                        titleMediumOnSecondaryContainer: "Что не включено",
                        titleSmall: "Самое необходимое")
                  ]));
  }
//=========================ListTitle Item=============================================

Widget _castomListTitleBody(
  BuildContext context, {
  required String checkmark,
  required String titleMediumOnSecondaryContainer,
  required String titleSmall,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    CustomImageView(
        imagePath: checkmark,
        height: 24.dp,
        width: 24.dp,
        color: basicTheme().colorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(vertical: 7.dp)),
    Padding(
        padding: EdgeInsets.only(left: 12.dp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(titleMediumOnSecondaryContainer,
              style: CustomTextStyles.titleMediumOnSecondaryContainer.copyWith(
                  color: basicTheme().colorScheme.onSecondaryContainer)),
          SizedBox(height: 1.dp),
          Text(titleSmall,
              style: basicTheme()
                  .textTheme
                  .titleSmall!
                  .copyWith(color: PrimaryColors().blueGray400))
        ])),
    const Spacer(),
    CustomImageView(
      imagePath: ImageConstant.imgArrowRight,
      height: 24.dp,
      width: 24.dp,
      color: basicTheme().colorScheme.secondaryContainer,
      margin: EdgeInsets.symmetric(vertical: 7.dp),
      onTap: () {
        //!!!!в задании не указанно
      },
    )
  ]);
}

  }
