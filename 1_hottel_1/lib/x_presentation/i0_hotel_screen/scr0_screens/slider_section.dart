import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSectionWidget extends StatelessWidget {
  const SliderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen0Provider>();
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10.dp, vertical: 15.dp), //! vertical: 3.dp
        //margin: EdgeInsets.symmetric(horizontal: 16.dp),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderBL12,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _sliderSection(read)),
              SizedBox(height: 16.dp),
              _ratingSection(read),
              SizedBox(height: 9.dp),
              _nameSection(read),
              SizedBox(height: 6.dp),
              _adressSection(read),
              SizedBox(height: 15.dp),
              _priceSection(read)
            ]));
  }

//!=============================================================================
//!=============================================================================
//!=========================Слайдер=============================================

  SizedBox _sliderSection(Screen0Provider read) {
    final orientation = Device.orientation;
    return SizedBox(
        height: 257.dp,
        width: orientation == 'portrait' ? Device.width : 343.dp,
        //,
        //343.dp
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Consumer<Screen0Provider>(builder: (context, provider, child) {
            //===============================CarouselSlider=================================
            return CarouselSlider.builder(
                options: CarouselOptions(
                    height: 257.dp,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      provider.changeSliderIndex(index);
                    }),
                itemCount: read.hotel?.imageUrls?.length ?? 0,
                itemBuilder: (context, index, realIndex) {
                  return Align(
                    alignment: Alignment.center,
                    child: CustomImageView(
                      imagePath: read.hotel?.imageUrls?[index] ??
                          ImageConstant.imgImage20,
                      fit: BoxFit.fill,
                      height: 257.dp,
                      width: Device.width,
                      //343.dp,
                      radius: BorderRadius.circular(
                        15.dp,
                      ),
                    ),
                  );
                });
          }),
          //====================================AnimatedSmoothIndicator=========================
          Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<Screen0Provider>(
                  builder: (context, provider, child) {
                return Container(
                    decoration: AppDecoration.fillWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    height: 17.dp,
                    margin: EdgeInsets.only(bottom: 8.dp),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AnimatedSmoothIndicator(
                          activeIndex: provider.sliderIndex,
                          count: read.hotel?.imageUrls?.length ?? 0,
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
                              dotHeight: 7.dp,
                              dotWidth: 7.dp)),
                    ));
              }))
          //==================================================
        ]));
  }

//!=====================Рейтинг секция============================================
  Container _ratingSection(Screen0Provider read) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.dp, vertical: 3.dp),
        decoration: AppDecoration.fillAmberA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          CustomImageView(
              imagePath: ImageConstant.imgStar22,
              height: 15.dp,
              width: 15.dp,
              color: PrimaryColors().amberA700,
              radius: BorderRadius.circular(1.dp),
              margin: EdgeInsets.symmetric(vertical: 3.dp)),
          Padding(
              padding: EdgeInsets.only(left: 2.dp, top: 2.dp),
              child: Text(
                  '${read.hotel?.rating} ${read.hotel?.ratingName}', //!Превосходно
                  style: CustomTextStyles.titleMediumAmberA700))
        ]));
  }

//!=====================Название секция============================================
  Text _nameSection(Screen0Provider read) {
    return Text('${read.hotel?.name} ', //! Название отеля
        style: basicTheme().textTheme.titleLarge);
  }

//!=====================Адрес секция============================================
  TextButton _adressSection(Screen0Provider read) {
    return TextButton(
      onPressed: () {},
      child: Text('${read.hotel?.adress} ', //! адреc

          maxLines: 1,
          style: CustomTextStyles.titleSmallPrimary),
    );
  }

//!=====================Прайс секция============================================
  Row _priceSection(Screen0Provider read) {
    return Row(children: [
      Text('от ${read.hotel?.minimalPrice} ₽', //! стоимость
          style: basicTheme().textTheme.headlineLarge),
      Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 8.dp, top: 14.dp),
            child: Text('${read.hotel?.priceForIt}', //! за тур с перелетом
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: basicTheme().textTheme.bodyLarge)),
      )
    ]);
  }

//!=============================================================================
}
