//ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/scr1_screens/room_data_widget.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/scr1_screens/slider_section.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/button_condition_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hottel_1/x_core/x_utils/image_constant.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_provider/scr1_provider.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/appbar_leading_circleimage.dart';
import 'package:hottel_1/x_presentation/scr1_apartment_screen/x_widgets/condition_item_widget.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import 'package:hottel_1/x_widgets/custom_image_view.dart';
import 'package:hottel_1/x_widgets/x_app_bar/appbar_title.dart';
import 'package:hottel_1/x_widgets/x_app_bar/custom_app_bar.dart';

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
      body: watch.apartment == null
          ? Center(child: CircularProgressIndicator())
          : ApartmentScreenBody(read: read),
    );
  }

  /// Section AppBar
  PreferredSizeWidget _buildAppBar(BuildContext context, nameHotel, read) {
    return CustomAppBar(
      leadingWidth: 48.dp,
      leading: AppbarLeadingCircleimage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 16.dp, top: 14.dp, bottom: 11.dp),
          onTap: () {
            read.onTapBack(context);
          }),
      centerTitle: true,
      title: AppbarTitle(text: nameHotel),
      styleType: Style.bgFill,
    );
  }
}

//!===================================================================
//!===================================================================
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
            width: Device.width,
            //==========================================
            child: Padding(
              padding: EdgeInsets.only(top: 8.dp),
              child:
                  //==========================
                  ListView.builder(
                itemCount: read.apartment?.rooms?.length ?? 0, //!
                itemBuilder: (BuildContext context, int indexRooms) {
                  final apdrtmentID = read.apartment?.rooms?[indexRooms].id;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                        padding: EdgeInsets.all(16.dp),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SliderSection(index: indexRooms), //!SliderSection
                              SizedBox(height: 7.dp),
                              RoomDataWidget(index: indexRooms),
                              SizedBox(height: 15.dp),

                              CustomElevatedButton(
                                text: 'Выбрать номер',
                                onPressed: () => read.showReservationScreen(
                                    context, apdrtmentID),
                              )
                            ])),
                  );
                },
              ),

              //! SizedBox(height: 8.dp),
            )));
  }
}
