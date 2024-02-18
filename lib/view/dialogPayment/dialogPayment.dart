import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/view/Profile/ticket.dart';

class DialogPayMent extends StatelessWidget {
  const DialogPayMent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.check_circle,
                  size: 190,
                  color: green,
                ),
                Text(
                  "Payment Successfull!",
                  style: TextStyle(
                      color: green, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Successfull made payment and hotel booking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w400, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                _buildViewTicket(),
                SizedBox(
                  height: 10,
                ),
                _buildCancel()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildViewTicket() => ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: green, minimumSize: Size(280, 50)),
      onPressed: () {
        Get.to(TicketScreen());
      },
      child: Text(
        "View Ticket",
        style: TextStyle(color: white),
      ));

  Widget _buildCancel() => ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: greenAccent, minimumSize: Size(280, 50)),
      onPressed: () {
        Get.back();
      },
      child: Text(
        "Cancel",
        style: TextStyle(color: green),
      ));
}
