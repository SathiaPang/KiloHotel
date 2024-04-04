import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/splashScreen/botton.dart';
import 'package:hotel/constant/constant.dart';
import '../../constant/appRoute.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
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
                image: AssetImage("assets/images/ht.jpg"), fit: BoxFit.fill)),
      );

  Widget _buildTitel() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height / 11,
          width: Get.width / 1.2,
          // color: green,
          child: const Text(
            "Find the best hotels for your vocation",
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
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SplashScreenBotton(
            text: "Next",
            textcolor: white,
            fontSize: 25,
            backgroundColor: green,
            // bottonsize: Size(350, 65),
            onPressed: () {
              Get.offAndToNamed(AppRoute.splash3);
            }),
      );

  Widget _buildSkipBotton() => SplashScreenBotton(
      text: "Skip",
      textcolor: green,
      fontSize: 25,
      backgroundColor: greenAccent,
      // bottonsize: Size(350, 65),
      onPressed: () {
        Get.offAndToNamed(AppRoute.load2);
      });
}
