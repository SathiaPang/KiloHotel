import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/response/user_reponse.dart';

class UpdateProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final UserRespoitory userRespoitory;
  UpdateProfileController({required this.userRespoitory});

  void updateProfile() async {
    String name = nameController.text.trim();
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();

    try {
      final res = await userRespoitory.updateProfile(
        username,
        name,
        phone,
        email,
        address,
      );
      if (res.status == 200) {
        print("-------------------------------Cange Success");
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
