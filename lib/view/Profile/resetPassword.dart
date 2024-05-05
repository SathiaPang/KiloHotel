import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/resetPassword_controller.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ResetPasswordController _resetPasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Change Password",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _resetPasswordController.oldPasswordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Colors.grey,
              onSaved: (password) {},
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: black, fontWeight: FontWeight.w500),
                labelText: 'Old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _resetPasswordController.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: Colors.grey,
                onSaved: (password) {},
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: black, fontWeight: FontWeight.w500),
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: _resetPasswordController.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Colors.grey,
              onSaved: (password) {},
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: black, fontWeight: FontWeight.w500),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _resetPasswordController.resetPassword();
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: green,
                foregroundColor: white,
                shadowColor: black,
                minimumSize: Size(410, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Update',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
