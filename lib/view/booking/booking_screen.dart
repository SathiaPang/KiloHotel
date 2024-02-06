import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Booking Screen"),
      ),
    );
  }
}
