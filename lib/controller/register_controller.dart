import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/response/register/register_response.dart';

class RegisterController extends GetxController {
  final formkeySignUp = GlobalKey<FormState>();

  // Register
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberControler = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  final UserRegisterRepository userRegisterRepository;

  RegisterController({required this.userRegisterRepository});

  void registerApp() async {
    if (userNameController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneNumberControler.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        addressController.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: red,
          messageText: Text(
            "Please fill in all of the field!!",
            style: TextStyle(fontSize: 16, color: white),
          ),
          duration: Duration(seconds: 1),
          borderRadius: 15,
          maxWidth: 400,
        ),
      );
      return;
    }
    try {
      final res = await userRegisterRepository.register(
          userNameController.text,
          nameController.text,
          emailController.text,
          passwordController.text,
          phoneNumberControler.text,
          addressController.text);
      if (res.registerData != null) {
        Get.offAllNamed(AppRoute.bottomNavigation);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.red,
            messageText: Text(
              "Registration failed. Please try again!",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            duration: Duration(seconds: 1),
            borderRadius: 15,
            maxWidth: 400,
          ),
        );
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.message ?? "Something went wrong",
        duration: Duration(seconds: 4),
      ));
    }
  }
}
