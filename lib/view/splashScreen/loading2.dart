import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/view/auth/signIn/signInScreen.dart';

class Loading2 extends StatefulWidget {
  const Loading2({super.key});

  @override
  State<Loading2> createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
  @override
  void initState() {
    Future.microtask(() => initLoading());
    super.initState();
  }

  void initLoading() {
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SigninScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: Column(
          children: [
            Image.asset("assets/images/blogo.jpg"),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5.5,
            ),
          ],
        ),
      ),
    );
  }
}
