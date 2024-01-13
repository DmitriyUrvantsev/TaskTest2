// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ApartmentScreen extends StatelessWidget {
  String nameHotel;
   ApartmentScreen({
    Key? key,
    required this.nameHotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Center(child: Text(nameHotel))));
  }
}
