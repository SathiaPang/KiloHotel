import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/Password/Unlock.png',
              width: size.width * 0.5,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Select which contact details should we use to reset your password",
              style: TextStyle(fontSize: 15.5),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 1.0,
              height: size.height * 0.15,
              child: Text("Hello there"),
              decoration: BoxDecoration(
                //color: green,
                border: Border.all(
                  color: green,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
