import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

class LoginController extends GetxController {
  final formkeySignIn = GlobalKey<FormState>();
  final formkeySignUp = GlobalKey<FormState>();

  // SignIn
  final userSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();

  // SignUp
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final fullNameController = TextEditingController();
  final nicknameController = TextEditingController();

  void loginApp() async {
    if (userSignInController.text.isEmpty ||
        passwordSignInController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: red,
        messageText: Text(
          "Username or Password is Empty!",
          style: TextStyle(fontSize: 16, color: white),
        ),
        duration: Duration(seconds: 1),
        borderRadius: 15,
        maxWidth: 400,
      ));

      return;
    }

    try {} on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.message ?? "Somthing wrong",
        duration: Duration(seconds: 1),
      ));
    }
  }
}
