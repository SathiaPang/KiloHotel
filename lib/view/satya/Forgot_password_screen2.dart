import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';

class ForgotPasswordScreen2 extends StatelessWidget {
  const ForgotPasswordScreen2({super.key});

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
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Password/verify.png',
              width: size.width * 0.65,
            ),
            Text("Code has been sent to +234111******99"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.078,
                  decoration: BoxDecoration(
                    color: grey,
                    border: Border.all(
                      color: green,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.078,
                  decoration: BoxDecoration(
                    color: grey,
                    border: Border.all(
                      color: green,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.078,
                  decoration: BoxDecoration(
                    color: grey,
                    border: Border.all(
                      color: green,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.078,
                  decoration: BoxDecoration(
                    color: grey,
                    border: Border.all(
                      color: green,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontWeight: FontWeight.w300),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Resend code in ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: '52 ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: green),
                  ),
                  TextSpan(
                    text: 's',
                    style: TextStyle(color: black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.26,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
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
