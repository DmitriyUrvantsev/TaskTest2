import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/widgets/discription_item_widget.dart';
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
    final read = context.read<Screen0Provider>();
    final watch = context.watch<Screen0Provider>();
    return Scaffold(
      body: watch.hotel == null
          ? Center(child: CircularProgressIndicator())
          : HotelScreenBody(read: read),
    );
  }
}

class HotelScreenBody extends StatelessWidget {
  const HotelScreenBody({
    super.key,
    required this.read,
  });
  final Screen0Provider read;

  @override
  Widget build(BuildContext context) {
    // print('1.v - ${1.v}');
    // print('1.dp - ${1.dp}');
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 5.dp),
                    child: Column(children: [
                      _castomSliderWidget(context, read),
                      SizedBox(height: 8.dp),
                      _descriptionWidget(context, read),
                    ])))),
        bottomNavigationBar: _buildBarsBars(context, read));
  }
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      height: 56.dp, centerTitle: true, title: AppbarTitle(text: 'Отель'));
}

//!====================================Slider=========================================
Widget _castomSliderWidget(BuildContext context, Screen0Provider read) {
  return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10.dp, vertical: 15.dp), //! vertical: 3.dp
      //margin: EdgeInsets.symmetric(horizontal: 16.dp),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL12,
        //color: Colors.amber[100]
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 257.dp,
                //width: Device.width,
                //,
                //343.dp
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Consumer<Screen0Provider>(
                      builder: (context, provider, child) {
                    //==================================================
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
                              //! потом подумать есди будет время//
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

                          //ThreeItemWidget(model); //! данные из Api
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
                            width: 75.dp,
                            margin: EdgeInsets.only(bottom: 8.dp),
                            child: Center(
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
                ])),
            SizedBox(height: 16.dp),

            Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.dp, vertical: 3.dp),
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
                ])),
            //==================================================

            SizedBox(height: 9.dp),
            Text('${read.hotel?.name} ', //! Название отеля
                style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 6.dp),

            TextButton(
              onPressed: () {},
              child: Text('${read.hotel?.adress} ', //! адреc

                  maxLines: 1,
                  style: CustomTextStyles.titleSmallPrimary),
            ),

            SizedBox(height: 15.dp),

            Row(children: [
              Text('от ${read.hotel?.minimalPrice} ₽', //! стоимость
                  style: basicTheme().textTheme.headlineLarge),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 8.dp, top: 14.dp),
                    child:
                        Text('${read.hotel?.priceForIt}', //! за тур с перелетом
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: basicTheme().textTheme.bodyLarge)),
              )
            ])
            //)
          ]));
}

//!================================Description "Об отеле"=============================================
/// Section Widget
Widget _descriptionWidget(BuildContext context, Screen0Provider read) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 15.dp),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        //color: Colors.blue[100]
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Об отеле", style: basicTheme().textTheme.titleLarge),
            SizedBox(height: 15.dp),
            Consumer<Screen0Provider>(builder: (context, provider, child) {
              return Wrap(
                  runSpacing: 8.dp,
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
            }),
            SizedBox(height: 11.dp),
            //================Описание==================================
            SizedBox(
                width: Device.width,
                child: Text(
                    '${read.hotel?.aboutTheHotel?.description}', //!+++++++++++++++

                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeSecondaryContainer_1
                        .copyWith(height: 1.20))),
            SizedBox(height: 13.dp),

//!==============================CastomListTile===========================

            Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.dp, vertical: 14.dp),
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
                      SizedBox(height: 9.dp),
                      Divider(indent: 38.dp),
                      SizedBox(height: 8.dp),
                      _castomListTitle(context,
                          checkmark: ImageConstant.imgCheckmark,
                          titleMediumOnSecondaryContainer: "Что включено",
                          titleSmall: "Самое необходимое"),
                      SizedBox(height: 9.dp),
                      Divider(indent: 38.dp),
                      SizedBox(height: 8.dp),
                      _castomListTitle(context,
                          checkmark: ImageConstant.imgClose,
                          titleMediumOnSecondaryContainer: "Что не включено",
                          titleSmall: "Самое необходимое")
                    ]))
          ]));
}

Widget _buildBarsBars(BuildContext context, Screen0Provider read) {
  final nameHotel = read.hotel?.name ?? '';
  return Container(
      margin: EdgeInsets.only(left: 16.dp, right: 16.dp, bottom: 28.dp),
      decoration: AppDecoration.outlineGray,
      child: CustomElevatedButton(
        text: 'К выбору номера',
        onPressed: () => read.showApartmenScreen(context, nameHotel),
      ));
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
