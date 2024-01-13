// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/chipviewsection2_item_model.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/chipviewsection_item_model.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_models/one_item_model.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_provider/scr1_provider.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_widgets/chipviewsection2_item_widget.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_widgets/chipviewsection_item_widget.dart';
import 'package:hottel_1/x_presentation/i1_apartment_screen/x_widgets/one_item_widget.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:hottel_1/x_widgets/x_app_bar/appbar_title.dart';
import 'package:hottel_1/x_widgets/x_app_bar/custom_app_bar.dart';

import '../../x_theme/custom_text_style.dart';

// ignore: must_be_immutable
class ApartmentScreen extends StatelessWidget {
  String nameHotel;
  ApartmentScreen({
    Key? key,
    required this.nameHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen1Provider>();
    final watch = context.watch<Screen1Provider>();
    return Scaffold(
      appBar: _buildAppBar(context, nameHotel, read),
      body: read.apartment == null
          ? Center(child: CircularProgressIndicator())
          : ApartmentScreenBody(read: read),
    );
  }

  /// Section AppBar
  PreferredSizeWidget _buildAppBar(BuildContext context, nameHotel, read) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingCircleimage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 11.v),
          onTap: () {
            read.onTapBack(context);
          }),
      centerTitle: true,
      title: AppbarTitle(text: nameHotel),
      styleType: Style.bgFill,
    );
  }
}

//===================================================================

class ApartmentScreenBody extends StatelessWidget {
  const ApartmentScreenBody({
    super.key,
    required this.read,
  });

  final Screen1Provider read;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: SizeUtils.width,
            //!==========================================
            //!==========================================
            //!==========================================
            child: Padding(
              padding: EdgeInsets.only(top: 8.v),
              child: Column(children: [
                //!==========================
                ListView.builder(
                  itemCount: read.apartment?.rooms?.length ?? 0, //!
                  itemBuilder: (BuildContext context, int indexRooms) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                          padding: EdgeInsets.all(16.h),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.roundedBorder12),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                _buildSliderSection(
                                    context, indexRooms), //!++++++++
                                SizedBox(height: 7.v),
                                Container(
                                    width: 337.h,
                                    margin: EdgeInsets.only(right: 5.h),
                                    child: Text(
                                        read.apartment?.rooms?[indexRooms]
                                                .name ??
                                            '', //!наименование
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: basicTheme()
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(height: 1.20))),

                                SizedBox(height: 4.v),

                                // _buildConditionsSection(
                                //     context, index), //!++++++++
                                SizedBox(height: 16.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 29.h),
                                    child: _buildRowSection(context,
                                        priceText: '${read.apartment?.rooms?[indexRooms]
                                                .price}',
                                        title: "msg_7")),
                                SizedBox(height: 15.v),
                                CustomElevatedButton(text: "lbl9")
                              ])),
                    );
                  },
                ),

                SizedBox(height: 8.v),

                // Container(
                //     padding: EdgeInsets.all(16.h),
                //     decoration: AppDecoration.fillWhiteA.copyWith(
                //         borderRadius: BorderRadiusStyle.roundedBorder12),
                //     child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           _buildStackSection(context),
                //           SizedBox(height: 8.v),
                //           SizedBox(
                //               width: 343.h,
                //               child: Text("msg5",
                //                   maxLines: null,
                //                   overflow: TextOverflow.ellipsis,
                //                   style: basicTheme()
                //                       .textTheme
                //                       .titleLarge!
                //                       .copyWith(height: 1.20))),
                //           SizedBox(height: 8.v),
                //           _buildChipViewSection1(context),
                //           SizedBox(height: 16.v),
                //           Padding(
                //               padding: EdgeInsets.only(right: 29.h),
                //               child: _buildRowSection(context,
                //                   priceText: "lbl_194_200", title: "msg_7")),
                //           SizedBox(height: 16.v),
                //           _buildButtonsPrimary(context)
                //         ]))
              ]),
            )
            )
            );
  }

  /// Section AppBar
  // PreferredSizeWidget _buildAppBar(BuildContext context, nameHotel) {
  //   return CustomAppBar(
  //       leadingWidth: 48.h,
  //       leading: AppbarLeadingCircleimage(
  //           imagePath: ImageConstant.imgArrowLeft,
  //           margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 11.v),
  //           onTap: () {
  //             onTapArrowLeft(context);
  //           }),
  //       centerTitle: true,
  //       title: AppbarTitle(text: nameHotel),
  //       styleType: Style.bgFill);
  // }



  /// Section Slider
  Widget _buildSliderSection(BuildContext context, indexRooms) {
    return SizedBox(
        height: 257.v,
        width: 343.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Consumer<Screen1Provider>(builder: (context, provider, child) {
            return CarouselSlider.builder(
                options: CarouselOptions(
                    height: 257.v,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      provider.sliderIndex = index;
                    }),
                itemCount: read.apartment?.rooms?[indexRooms].imageUrls?.length ?? 0,//!========
                //!provider.k1ModelObj.oneItemList.length,
                itemBuilder: (context, index, realIndex) {
                  //! OneItemModel model = provider.k1ModelObj.oneItemList[index];
                  return Align(
                    alignment: Alignment.center,
                    child: CustomImageView(
                      imagePath: read.apartment!.rooms![indexRooms].imageUrls?[index]?? '',//!========
                         
                      height: 257.v,
                      width: 343.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
                  );
                });
          }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<Screen1Provider>(
                  builder: (context, provider, child) {
                return Container(
                    height: 17.v,
                    margin: EdgeInsets.only(bottom: 8.v),
                    child: AnimatedSmoothIndicator(
                        activeIndex: provider.sliderIndex,
                        count: 2,
                        //!provider.k1ModelObj.oneItemList.length,
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
                            dotWidth: 7.h)));
              }))
        ]));
  }

  /// Section все вкючено
  Widget _buildConditionsSection(BuildContext context, index) {
    return Consumer<Screen1Provider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
              read.apartment?.rooms?[index].peculiarities?.length ?? 0, //!====
              //2,
              //provider.k1ModelObj.chipviewsectionItemList.length,
              (i) {
            // ChipviewsectionItemModel model =
            //     provider.k1ModelObj.chipviewsectionItemList[index];
            return Text('${read.apartment?.rooms?[index].peculiarities?[i]}');//!====
            // ChipviewsectionItemWidget(model,
            //     onSelectedChipView1: (value) {
            //   provider.onSelectedChipView1(index, value);
            // });
          }));
    });
  }

  /// Section Widget
  Widget _buildStackSection(BuildContext context) {
    return SizedBox(
        height: 257.v,
        width: 343.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage201,
              height: 257.v,
              width: 343.h,
              radius: BorderRadius.circular(15.h),
              alignment: Alignment.center),
          CustomImageView(
              imagePath: ImageConstant.imgIconsPinsPinsSegment,
              height: 17.v,
              width: 75.h,
              radius: BorderRadius.circular(5.h),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 8.v))
        ]));
  }

  /// Section Widget
  Widget _buildChipViewSection1(BuildContext context) {
    return Consumer<Screen1Provider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(2,
              //provider.k1ModelObj.chipviewsection2ItemList.length,
              (index) {
            // Chipviewsection2ItemModel model =
            //     provider.k1ModelObj.chipviewsection2ItemList[index];
            return Text('5555555555');
            // Chipviewsection2ItemWidget(model,
            //     onSelectedChipView2: (value) {
            //   provider.onSelectedChipView2(index, value);
            // });
          }));
    });
  }

  /// Section Widget
  Widget _buildButtonsPrimary(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Text("lbl9",
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumWhiteA700));
  }

  /// Common widget
  Widget _buildRowSection(
    BuildContext context, {
    required String priceText,
    required String title,
  }) {
    return Row(children: [
      Text(priceText,
          style: basicTheme().textTheme.headlineLarge!.copyWith(
              color:
                  basicTheme().colorScheme.secondaryContainer.withOpacity(1))),
      Padding(
          padding: EdgeInsets.only(left: 9.h, top: 14.v, bottom: 3.v),
          child: Text(title,
              style: basicTheme().textTheme.bodyLarge!.copyWith(
                  color: basicTheme()
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(1))))
    ]);
  }
}
