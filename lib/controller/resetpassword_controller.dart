import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/response/reset_response.dart';

class ResetPasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final RxBool isLoading = false.obs;

  final ResetRepository resetRepository; // Add ResetRepository
  ResetPasswordController({required this.resetRepository});

  void resetPassword() async {
    String oldPassword = oldPasswordController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: red,
        messageText: Text("Please fill in all fields"),
        duration: Duration(seconds: 2),
        borderRadius: 15,
        maxWidth: 400,
      ));
      return;
    }

    if (password != confirmPassword) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.red,
        messageText: Text(
          "New password and confirm password do not match",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        borderRadius: 15,
        maxWidth: 400,
      ));
      return;
    }

    try {
      final res = await resetRepository.resetpassword(
          oldPassword, password, confirmPassword);
      // Handle the response here based on the ResetResponse structure
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "An error occurred while resetting password",
        duration: Duration(seconds: 2),
      ));
    }
  }
}
