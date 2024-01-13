import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_data/hotel.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/models/discription_item_model.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/models/three_item_model.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/widgets/discription_item_widget.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/widgets/three_item_widget.dart';
import 'package:hottel_1/x_servises/api_client.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../x_core/x_utils/size_utils.dart';
import '../../x_theme/app_decoration.dart';
import '../../x_widgets/x_app_bar/appbar_title.dart';
import '../../x_widgets/x_app_bar/custom_app_bar.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<I0Provider>();
    final watch = context.watch<I0Provider>();
    return Scaffold(
      body: read.hotel == null
          ? Center(child: CircularProgressIndicator())
          : HotelScreenBody(read: read),
    );
  }
}

//!Center(child: Text('${read.hotel?.adress}'));
class HotelScreenBody extends StatelessWidget {
  const HotelScreenBody({
    super.key,
    required this.read,
  });
  final I0Provider read;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(children: [
                      _castomSliderWidget(context, read),
                      SizedBox(height: 23.v),
                      _descriptionWidget(context, read),
                    ])))),
        bottomNavigationBar: _buildBarsBars(context));
  }
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      height: 56.v,
      centerTitle: true,
      title: AppbarTitle(text: 'Отель'
          //!-----"lbl".tr
          ));
}

//!====================================Slider=========================================
Widget _castomSliderWidget(BuildContext context, I0Provider read) {
  return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10.h, vertical: 15.v), //! vertical: 3.v
      //margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL12,
        //color: Colors.amber[100]
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 257.v,
                width: double.infinity,
                //343.h,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Consumer<I0Provider>(builder: (context, provider, child) {
                    //==================================================
                    return CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 257.v,
                            initialPage: 0,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              provider.changeSliderIndex(index);
                            }),
                        itemCount: provider.k0ModelObj.threeItemList.length,
                        itemBuilder: (context, index, realIndex) {
                          ThreeItemModel model =
                              provider.k0ModelObj.threeItemList[index];
                          return ThreeItemWidget(model); //! данные из Api
                        });
                  }),
                  //==================================================
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Consumer<I0Provider>(
                          builder: (context, provider, child) {
                        //print('${provider.sliderIndex}');
                        return Container(

                            //color: PrimaryColors().whiteA700,
                            decoration: AppDecoration.fillWhiteA.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5),
                            height: 17.v,
                            width: 75.h,
                            margin: EdgeInsets.only(bottom: 8.v),
                            child: Center(
                              child: AnimatedSmoothIndicator(
                                  activeIndex: provider.sliderIndex,
                                  count:
                                      provider.k0ModelObj.threeItemList.length,
                                  axisDirection: Axis.horizontal,
                                  effect: ScrollingDotsEffect(
                                      spacing: 5,
                                      activeDotColor: basicTheme()
                                          .colorScheme
                                          .secondaryContainer
                                          .withOpacity(1),
                                      dotColor: basicTheme()
                                          .colorScheme
                                          .secondaryContainer
                                          .withOpacity(0.22),
                                      dotHeight: 7.v,
                                      dotWidth: 7.h)),
                            ));
                      }))
                  //==================================================
                ])),
            SizedBox(height: 16.v),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
                decoration: AppDecoration.fillAmberA
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath:
                          ImageConstant.imgStar22, //!++++++++++++++++++++++++
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      color: PrimaryColors().amberA700,
                      radius: BorderRadius.circular(1.h),
                      margin: EdgeInsets.symmetric(vertical: 3.v)),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h, top: 2.v),
                      child: Text(
                          '${read.hotel?.rating} ${read.hotel?.ratingName}',
                          style: CustomTextStyles.titleMediumAmberA700))
                ])),
            //==================================================

            SizedBox(height: 9.v),
            Text('${read.hotel?.name} ', //! Название отеля
                style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 6.v),
            Text('${read.hotel?.adress} ', //! адре
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: CustomTextStyles.titleSmallPrimary),
            SizedBox(height: 15.v),

            //Padding(
            //padding: EdgeInsets.only(right: 26.h),
            //child:
            Row(children: [
              Text('от ${read.hotel?.minimalPrice} ₽', //! стоимость
                  style: basicTheme().textTheme.headlineLarge),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 8.h, top: 14.v),
                    child: Text('${read.hotel?.priceForIt}', //! за тур с перелетом
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: basicTheme().textTheme.bodyLarge)),
              )
            ])
            //)
          ]));
}

//!================================Description=============================================
/// Section Widget
Widget _descriptionWidget(BuildContext context, I0Provider read) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        //color: Colors.blue[100]
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Об отеле", //! возможно из API
                style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 15.v),
            Consumer<I0Provider>(builder: (context, provider, child) {
              return Wrap(
                  runSpacing: 8.v,
                  spacing: 8.h,
                  children: List<Widget>.generate(
                      provider.k0ModelObj.framenineItemList.length, (index) {
                    DiscriptionItemModel model =
                        provider.k0ModelObj.framenineItemList[index];
                    return DiscriptionItemWidget(model,
                        onSelectedChipView1: (value) {
                      provider.onSelectedChipView1(index, value);
                    });
                  }));
            }),
            SizedBox(height: 11.v),
            //==================================================
            SizedBox(
                width: 340.h,
                child: Text('${read.hotel?.adress}', //!+++++++++++++++

                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeSecondaryContainer_1
                        .copyWith(height: 1.20))),
            SizedBox(height: 13.v),

            //!==============================CastomListTile===========================
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
                decoration: AppDecoration.fillGray50.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _castomListTitle(context,
                          checkmark: ImageConstant.imgSettings,
                          titleMediumOnSecondaryContainer: "Удобства",
                          titleSmall: "Самое необходимое"),
                      SizedBox(height: 9.v),
                      Divider(indent: 38.h),
                      SizedBox(height: 8.v),
                      _castomListTitle(context,
                          checkmark: ImageConstant.imgCheckmark,
                          titleMediumOnSecondaryContainer: "Что включено",
                          titleSmall: "Самое необходимое"),
                      SizedBox(height: 9.v),
                      Divider(indent: 38.h),
                      SizedBox(height: 8.v),
                      _castomListTitle(context,
                          checkmark: ImageConstant.imgClose,
                          titleMediumOnSecondaryContainer: "Что не включено",
                          titleSmall: "Самое необходимое")
                    ]))
          ]));
}

//!==============================CastomListTile===========================

Widget _buildBarsBars(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 28.v),
      decoration: AppDecoration.outlineGray,
      child: CustomElevatedButton(text: 'К выбору номера'));
}

// /// Common widget
Widget _castomListTitle(
  BuildContext context, {
  required String checkmark,
  required String titleMediumOnSecondaryContainer,
  required String titleSmall,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    CustomImageView(
        imagePath: checkmark,
        height: 24.adaptSize,
        width: 24.adaptSize,
        color: basicTheme().colorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(vertical: 7.v)),
    Padding(
        padding: EdgeInsets.only(left: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(titleMediumOnSecondaryContainer,
              style: CustomTextStyles.titleMediumOnSecondaryContainer.copyWith(
                  color: basicTheme().colorScheme.onSecondaryContainer)),
          SizedBox(height: 1.v),
          Text(titleSmall,
              style: basicTheme()
                  .textTheme
                  .titleSmall!
                  .copyWith(color: PrimaryColors().blueGray400))
        ])),
    const Spacer(),
    CustomImageView(
      imagePath: ImageConstant.imgArrowRight,
      height: 24.adaptSize,
      width: 24.adaptSize,
      color: basicTheme().colorScheme.secondaryContainer,
      margin: EdgeInsets.symmetric(vertical: 7.v),
      onTap: () {
        //!!!!в задании не указанно
      },
    )
  ]);
}
