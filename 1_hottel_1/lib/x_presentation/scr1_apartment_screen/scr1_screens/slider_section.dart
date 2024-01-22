// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_provider/scr1_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderSection extends StatelessWidget {
  final int index;
  const SliderSection({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen1Provider>();
    final indexRooms = index;
    return Center(
      child: SizedBox(
          height: 257.dp,
          width: Device.width,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Consumer<Screen1Provider>(builder: (context, provider, child) {
              return
                  //============================================
                  CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 257.dp,
                          initialPage: 0,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            provider.sliderIndex = index;
                          }),
                      itemCount: read.apartment?.rooms?[indexRooms].imageUrls
                              ?.length ??
                          0, //!========
                      itemBuilder: (context, index, realIndex) {
                        return Align(
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: read.apartment!.rooms![indexRooms]
                                    .imageUrls?[index] ??
                                '', //!========
                            height: 267.dp,
                            width: Device.width,
                            fit: BoxFit.fill,
                            radius: BorderRadius.circular(
                              15.dp,
                            ),
                          ),
                        );
                      });
            }),
            //===================================================
            Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<Screen1Provider>(
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
                            count: read.apartment?.rooms?[indexRooms].imageUrls
                                    ?.length ??
                                0, //!========
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
                                dotHeight: 7.dp,
                                dotWidth: 7.dp)),
                      ));
                }))
          ])),
    );
  }
}
