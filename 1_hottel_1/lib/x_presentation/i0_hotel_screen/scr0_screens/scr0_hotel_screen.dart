import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/app_export.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/provider/i0_provider.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/scr0_screens/about_hotel.dart';
import 'package:hottel_1/x_presentation/i0_hotel_screen/scr0_screens/slider_section.dart';
import 'package:hottel_1/x_widgets/custom_elevated_button.dart';
import '../../../x_core/x_utils/size_utils.dart';
import '../../../x_theme/app_decoration.dart';
import '../../../x_widgets/x_app_bar/appbar_title.dart';
import '../../../x_widgets/x_app_bar/custom_app_bar.dart';

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
    return Scaffold(
        appBar: _appBarSection(context),
        body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 5.dp),
                    child: Column(children: [
                      const SliderSectionWidget(),
                      SizedBox(height: 8.dp),
                      const AboutHotelWidget(),
                    ])))),
        bottomNavigationBar: _bottomBarSection(context, read));
  }
}

//!=============================================================================
//!=========================AppBar==============================================
PreferredSizeWidget _appBarSection(BuildContext context) {
  return CustomAppBar(
      height: 56.dp, centerTitle: true, title: AppbarTitle(text: 'Отель'));
}

//!=========================BottomBar==============================================
Widget _bottomBarSection(BuildContext context, Screen0Provider read) {
  final nameHotel = read.hotel?.name ?? '';
  final orientation = Device.orientation;
  return Container(
      margin: EdgeInsets.only(left: 16.dp, right: 16.dp, bottom: 28.dp),
      decoration: AppDecoration.outlineGray,
      child: CustomElevatedButton(
        height: orientation == 'portrait' ? null : 48.dp,
        text: 'К выбору номера',
        onPressed: () => read.showApartmenScreen(context, nameHotel),
      ));
}
