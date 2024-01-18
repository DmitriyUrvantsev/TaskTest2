import 'package:flutter/material.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:provider/provider.dart';

class DepartureData extends StatelessWidget {
  const DepartureData({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen2Provider>();
    //final watch = context.watch<Screen2Provider>();
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: [
        _buildNameListDepartureData(),
        Positioned(left: 163.v, child: _buildDataListDepartureData(read))
      ],
    ));
  }

  //===========================================================================
  //===========================================================================
  //===========================================================================

  Container _buildNameListDepartureData() {
    return Container(
      width: 375.v,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 1.v),
                child:
                    Text('Вылет из', style: basicTheme().textTheme.bodyLarge)),
            SizedBox(height: 14.v),
            Text("Страна, город", style: basicTheme().textTheme.bodyLarge),
            SizedBox(height: 13.v),
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text('Даты', style: basicTheme().textTheme.bodyLarge)),
            SizedBox(height: 13.v),
            Text("Кол-во ночей", style: basicTheme().textTheme.bodyLarge),
            SizedBox(height: 15.v),
            Padding(
                padding: EdgeInsets.only(bottom: 1.v),
                child: Text('Отель', style: basicTheme().textTheme.bodyLarge)),
            SizedBox(height: 13.v),
            Padding(
                padding: EdgeInsets.only(top: 1.v, bottom: 19.v),
                child: Text("Номер", style: basicTheme().textTheme.bodyLarge)),
            SizedBox(height: 13.v),
            Text("Питание", style: basicTheme().textTheme.bodyLarge)
          ]),
    );
  }

  //===========================================================================

  Container _buildDataListDepartureData(read) => Container(
      //width: 200.v,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 1.v),
                child: Text('${read.apartmentData?.departure} ', //Вылет из
                    style: CustomTextStyles.bodyLargeSecondaryContainer)),

            SizedBox(height: 14.v),

            Text('${read.apartmentData?.arrivalCountry} ', //Страна, город
                style: CustomTextStyles.bodyLargeSecondaryContainer),
            SizedBox(height: 13.v),
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text(
                    //Даты
                    '${read.apartmentData?.tourDateStart} - ${read.apartmentData?.tourDateStop}',
                    style: CustomTextStyles.bodyLargeSecondaryContainer)),
            SizedBox(height: 13.v),
            Text('${read.apartmentData?.numberOfNights}', // Колво  ночей

                style: CustomTextStyles.bodyLargeSecondaryContainer),
            SizedBox(height: 15.v),
            Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: SizedBox(
                width: 200.v,
                child: Text('${read.apartmentData?.hotelName}', //Отель
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeSecondaryContainer),
              ),
            ),
            SizedBox(height: 13.v),
            Padding(
                padding: EdgeInsets.only(top: 1.v, bottom: 19.v),
                child: SizedBox(
                  width: 195.v,
                  child: Text('${read.apartmentData?.room}', //Номер
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeSecondaryContainer
                          .copyWith(height: 1.20)),
                )),
            SizedBox(height: 13.v),
            Text('${read.apartmentData?.nutrition}',
                style: CustomTextStyles.bodyLargeSecondaryContainer)

                ]));
}
