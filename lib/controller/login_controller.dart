import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/response/user_reponse.dart';

class LoginController extends GetxController {
  final formkeySignIn = GlobalKey<FormState>();
  final formkeySignUp = GlobalKey<FormState>();

  // SignIn
  final userSignInController = TextEditingController(text: "super admin");
  final passwordSignInController = TextEditingController(text: "321");

  // SignUp
  final username = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();


  final UserRespoitory userRespoitory;
  LoginController({required this.userRespoitory});

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

    try {
      final res = await userRespoitory.login(
          userSignInController.text, passwordSignInController.text);
      if (res.data != null) {
        Get.offAllNamed(AppRoute.bottomNavigation);
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.message ?? "Somthing wrong",
        duration: Duration(seconds: 1),
      ));
    }
  }
  void signUpApp() async {

  }
}
