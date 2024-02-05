import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/view/splashScreen/splashScreen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() => initloading());
    super.initState();
  }

  void initloading() {
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SplashScreen1())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ht.jpg"), fit: BoxFit.fill)),
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                strokeWidth: 5.5,
              ),
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              Text(
                "Bolu",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              Text(
                "The best hotel booking in the century to accompany your vocation",
                style: TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
