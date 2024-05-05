import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/response/user_reponse.dart';

class RegisterController extends GetxController {
  RegisterController({required this.userRespoitory});
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final UserRespoitory userRespoitory;

  Future<void> register() async {
    if (nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: red,
        messageText: Text(
          "Please input !",
          style: TextStyle(fontSize: 16, color: white),
        ),
        duration: Duration(seconds: 1),
        borderRadius: 15,
        maxWidth: 400,
      ));
      return;
    } else {
      try {
        final res = await userRespoitory.register(
          usernameController.text,
          nameController.text,
          phoneController.text,
          emailController.text,
          passwordController.text,
          addressController.text,
        );
        if (res['status'] == 200) {
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: green,
            messageText: Text(
              "Signin Success",
              style: TextStyle(fontSize: 16, color: white),
            ),
            duration: Duration(seconds: 1),
            borderRadius: 15,
            maxWidth: 400,
          ));
          Get.toNamed(AppRoute.login);
        }
      } on DioException catch (e) {
        print("=============================> Error:  $e");
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: red,
          messageText: Text(
            "Error ",
            style: TextStyle(fontSize: 16, color: white),
          ),
          duration: Duration(seconds: 1),
          borderRadius: 15,
          maxWidth: 400,
        ));
      }
    }
  }
}
