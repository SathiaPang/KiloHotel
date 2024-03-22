import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/local/local.dart';
import 'package:hotel/response/user_reponse.dart';

class LoginController extends GetxController {
  final formkeySignIn = GlobalKey<FormState>();
  final formkeySignUp = GlobalKey<FormState>();

  // SignIn
  final userSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();

  final UserRespoitory userRespoitory;
  final perfs = LocalStorageManager.instance;
  // final UserStorageApp userStorageApp = UserStorageApp();

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
        userSignInController.text,
        passwordSignInController.text,
      );
      if (res.status == 200) {
        LocalStorageManager.instance.saveToCache("Token", res.data!.token);
        print("------------------${res.data?.token}-------------------------");
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
        Get.offAllNamed(AppRoute.bottomNavigation);
      }
    } on DioException catch (e) {
      print("-------------------------------------------> $e");
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: red,
        messageText: Text(
          "Wrong Username or Password",
          style: TextStyle(fontSize: 16, color: white),
        ),
        duration: Duration(seconds: 1),
        borderRadius: 15,
        maxWidth: 400,
      ));
    }
  }

  void getToken() async {
    final token = await LocalStorageManager.instance.getFromCache("Token");
    print("---------------Then Login ${token}");
  }
}
