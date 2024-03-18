import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/resetPassword_controller.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

final ResetPasswordController _resetPasswordController = Get.find();

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // This is using navigate back
              },
            ),
            Text("Change Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
        automaticallyImplyLeading: false, // Disable the default back button
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _resetPasswordController.oldPasswordController,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.password,
                    color: textColor,
                  ),
                  onPressed: () {
                    print('Search');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              // controller: resetPasswordController.passwordController,
              controller: _resetPasswordController.passwordController,
              decoration: InputDecoration(
                hintText: "New Password",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.pin_sharp),
                  onPressed: () {
                    print('Search');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _resetPasswordController.confirmPasswordController,
              decoration: InputDecoration(
                hintText: "Comfirm Password",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.pin_sharp),
                  onPressed: () {
                    print('Search');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  _resetPasswordController.resetPassword();
                  Get.offAllNamed(AppRoute.changePassword);
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
