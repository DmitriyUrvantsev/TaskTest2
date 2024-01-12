import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/models/discription_item_model.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/models/three_item_model.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/widgets/discription_item_widget.dart';
import 'package:hottel_1/x_presentation/i0_hotell_screen/widgets/three_item_widget.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../x_core/x_utils/size_utils.dart';
import '../../x_theme/app_decoration.dart';
import '../../x_widgets/x_app_bar/appbar_title.dart';
import '../../x_widgets/x_app_bar/custom_app_bar.dart';

// class HotellScreen extends StatelessWidget {
//   const HotellScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Container(child: Center(child: Text('hotel'))));
//   }
// }

class HotellScreen extends StatefulWidget {
  const HotellScreen({super.key});

  @override
  State<HotellScreen> createState() => _HotellScreenState();
}

class _HotellScreenState extends State<HotellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(children: [
                    _castomSliderWidget(context),
                    SizedBox(height: 23.v),
                    _discriptionWidget(context)
                  ])))),
      //! bottomNavigationBar: _buildBarsBars(context)
    );
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
Widget _castomSliderWidget(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.customBorderBL12),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 257.v,
                width: 343.h,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Consumer<K0Provider>(builder: (context, provider, child) {
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
                      child: Consumer<K0Provider>(
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
            //==================================================
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
                decoration: AppDecoration.fillAmberA
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgStar22,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      radius: BorderRadius.circular(1.h),
                      margin: EdgeInsets.symmetric(vertical: 3.v)),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h, top: 2.v),
                      child: Text(
                          'Превосходно', //! добавить звезду и оценку из API
                          style: CustomTextStyles.titleMediumAmberA700))
                ])),
            //==================================================

            SizedBox(height: 9.v),
            Text('Название отеля', //! данные из Api
                style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 6.v),
            Text("Местоположение отеля", //! данные из Api
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: CustomTextStyles.titleSmallPrimary),
            SizedBox(height: 15.v),

            Padding(
                padding: EdgeInsets.only(right: 26.h),
                child: Row(children: [
                  Text('Стоимость', //! данные из Api
                      style: basicTheme().textTheme.headlineLarge),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 8.h, top: 14.v),
                        child: Text('доп. информация', //! данные из Api
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: basicTheme().textTheme.bodyLarge)),
                  )
                ]))
          ]));
}

//!=============================================================================
/// Section Widget
Widget _discriptionWidget(BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Об отеле", //! возможно из API
                style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 15.v),
            Consumer<K0Provider>(builder: (context, provider, child) {
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
                child: Text(
                    "Отель длодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлор длодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлордлодолдлод лотдтдло лтодотдл лотдлтдлдлд лотлор",
                    //! данные из Api
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeSecondaryContainer_1
                        .copyWith(height: 1.20))),
            SizedBox(height: 13.v),

            //!==================================================
            // CustomImageView(
            //   imagePath: 'assets/images/iimg_image_20_1.png',
            //   // height: 24.adaptSize,
            //   // width: 24.adaptSize,
            //   // margin: EdgeInsets.symmetric(vertical: 7.v)
            // ),

            // Image.asset('assets/images/iimg_image_20_1.png'),
            // Container(
            //   child: Image(image: AssetImage('assets/images/img_settings.svg')),
            // ),
            ////!==================================================

            //==================================================
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
                decoration: AppDecoration.fillGray50
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildFour(context,
                          checkmark: ImageConstant.imgSettings,
                          titleMediumOnSecondaryContainer: "lbl3",
                          titleSmall: "msg2"),
                      SizedBox(height: 9.v),
                      Divider(indent: 38.h),
                      SizedBox(height: 8.v),
                      _buildFour(context,
                          checkmark: ImageConstant.imgCheckmark,
                          titleMediumOnSecondaryContainer: "lbl4",
                          titleSmall: "msg2"),
                      SizedBox(height: 9.v),
                      Divider(indent: 38.h),
                      SizedBox(height: 8.v),
                      _buildFour(context,
                          checkmark: ImageConstant.imgClose,
                          titleMediumOnSecondaryContainer: "lbl5",
                          titleSmall: "msg2")
                    ]))
          ]));
}

// /// Section Widget
// Widget _buildBarsBars(BuildContext context) {
//   return Container(
//       margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 28.v),
//       decoration: AppDecoration.outlineGray,
//       child: CustomElevatedButton(text: "lbl6".tr));
// }

// /// Common widget
Widget _buildFour(
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
        margin: EdgeInsets.symmetric(vertical: 7.v))
  ]);
}

// }
