import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';

class DialogPayMent extends StatefulWidget {
  const DialogPayMent({super.key});

  @override
  State<DialogPayMent> createState() => _DialogPayMentState();
}

class _DialogPayMentState extends State<DialogPayMent> {
  @override
  void initState() {
    Future.microtask(() => initLoading());
    super.initState();
  }

  void initLoading() async {
    Timer(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoute.bottomNavigation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
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
                "Booking Successfull!",
                style: TextStyle(
                    color: green, fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Successfull made hotel booking",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w400, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                strokeWidth: 5.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
