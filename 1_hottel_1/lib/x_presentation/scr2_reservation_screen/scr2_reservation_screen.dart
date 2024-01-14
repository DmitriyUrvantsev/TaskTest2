import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReservationScreen extends StatelessWidget {
  int apartmentID;
  ReservationScreen({
    Key? key,
    required this.apartmentID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final read = context.read<Screen2Provider>();
    //final watch = context.watch<Screen2Provider>();
    return Scaffold(
      body: Center(child: Text('$apartmentID')),
      // appBar: _buildAppBar(context, nameHotel, read),
      // body: watch.apartment == null
      //     ? Center(child: CircularProgressIndicator())
      //     : ReservationScreenBody(read: read),
    );
  }
}
