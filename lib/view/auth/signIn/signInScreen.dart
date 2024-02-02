import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/view/soklay/selectdate.dart';
import 'package:hotel/view/auth/signUp/createAccount.dart';
import 'package:hotel/view/auth/signUp/signUpScreen.dart';

import '../../home/homeScreen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Let's you in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            _Custombox(
                imagepath: 'assets/images/facebook.png',
                text: 'Continue with Facebook'),
            _Custombox(
                imagepath: 'assets/images/google.png',
                text: 'Continue with Google'),
            _Custombox(
                imagepath: 'assets/images/apple.png',
                text: 'Continue with Apple'),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 150,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 1,
                  width: 150,
                  color: Colors.black,
                ),
              ],
            ),
            _buildButton(),

            // Test Botton soklay
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SelectDate());
                },
                child: Text("Select Date Screen")),
            // ======================
            Spacer(),
            _buildDontHaveAccount(context)
          ]),
        ),
      ),
    );
  }
}

Widget _Custombox({required String imagepath, required String text}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagepath,
              // height: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
Widget _buildButton() => Padding(
      padding: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(350, 65),
          backgroundColor: green,
        ),
        onPressed: () {
          // Get.to(CreateAcc());
          Get.to(HomeScreen());
        },
        child: Center(
          child: Text(
            'Sign in with Password',
            style: TextStyle(color: white, fontSize: 17),
          ),
        ),
      ),
    );
Widget _buildDontHaveAccount(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
