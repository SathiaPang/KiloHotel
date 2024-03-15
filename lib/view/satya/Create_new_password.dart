import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/resetpassword_controller.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isChecked = false;
  final ResetPasswordController resetPasswordController = Get.find();
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
            Text("Create New Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
        automaticallyImplyLeading: false, // Disable the default back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: resetPasswordController.oldPasswordController,
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
              controller: resetPasswordController.passwordController,
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
              controller: resetPasswordController.confirmPasswordController,
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
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked ?? false,
                  onChanged: (value) {
                    setState(
                      () {
                        isChecked = value ?? false;
                      },
                    );
                  },
                ),
                Text('Remember me'),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  resetPasswordController.resetPassword();
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
