import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/password/Forgot_password_screen2.dart';

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
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greenAccent,
                        ),
                      ),
                      Image.asset(
                        'assets/images/Password/icons8-comment-100.png',
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'vai SMS',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: textColor),
                      ),
                      Text(
                        '+234111******99',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                //color: green,
                border: Border.all(
                  color: green,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 1.0,
              height: size.height * 0.15,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greenAccent,
                        ),
                      ),
                      Image.asset(
                        'assets/images/Password/icons8-email-100.png',
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'via Email:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: textColor),
                      ),
                      Text(
                        'kez***9@your domain.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                //color: green,
                border: Border.all(
                  color: green,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ForgotPasswordScreen2());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: green,
                  foregroundColor: white,
                  shadowColor: black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
