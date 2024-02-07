import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formkeySignIn = GlobalKey<FormState>();
  final formkeySignUp = GlobalKey<FormState>();

  // SignIn
  final emailSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();

  // SignUp
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final fullNameController = TextEditingController();
  final nicknameController = TextEditingController();
}
