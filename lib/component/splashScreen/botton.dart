import 'package:flutter/material.dart';

class SplashScreenBotton extends StatelessWidget {
  const SplashScreenBotton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.bottonsize,
      required this.backgroundColor,
      required this.textcolor,
      required this.fontSize});
  final String text;
  final VoidCallback onPressed;
  final Size bottonsize;
  final Color backgroundColor;
  final Color textcolor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: bottonsize, backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: fontSize),
        ));
  }
}
