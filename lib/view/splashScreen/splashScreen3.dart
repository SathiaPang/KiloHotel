import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/view/splashScreen/loading2.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        body: Column(
          children: [
            //
            _builImage(),
            _buildTitel(),
            _builSubTitle(),
            _buildIndex(),
            _buildNextBotton(),
            _buildSkipBotton()
          ],
        ));
  }

  Widget _builImage() => Container(
        height: Get.height / 2,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/hotel.jpg"),
                fit: BoxFit.fill)),
      );

  Widget _buildTitel() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height / 11,
          width: Get.width / 1.2,
          // color: green,
          child: const Text(
            "Let's discover the word with us",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget _builSubTitle() => Container(
        height: Get.height / 14,
        width: Get.width / 1.2,
        // color: black,
        child: const Text(
          "Lorem ipsum dolor sit amet, conecteture adiiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnaaliqua ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: textColor),
        ),
      );

  Widget _buildIndex() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: Get.height / 50,
          width: Get.width / 3.5,
          // color: green,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // index 1
              CircleAvatar(
                radius: 5,
                backgroundColor: green,
              ),

              // index 2
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: textColor,
              ),

              // index 3
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: textColor,
              ),
            ],
          ),
        ),
      );

  Widget _buildNextBotton() => Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 65), backgroundColor: green),
            onPressed: () {
              Get.offAndToNamed(AppRoute.load2);
            },
            child: const Center(
                child: Text(
              "Next",
              style: TextStyle(fontSize: 25, color: white),
            ))),
      );

  Widget _buildSkipBotton() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 65), backgroundColor: greenAccent),
            onPressed: () {
              Get.offAndToNamed(AppRoute.load2);
            },
            child: const Center(
                child: Text(
              "Skip",
              style: TextStyle(fontSize: 25, color: green),
            ))),
      );
}
