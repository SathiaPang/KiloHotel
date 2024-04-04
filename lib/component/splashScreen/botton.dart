import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenBotton extends StatelessWidget {
  const SplashScreenBotton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textcolor,
      required this.fontSize});
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textcolor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(Get.width / 1.2, Get.height / 17),
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: fontSize),
        ));
  }
}
