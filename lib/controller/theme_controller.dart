import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/local/themeCatch/theme_catch.dart';

class ThemeController extends GetxController {
  var isdark = false;

  void changeTheme(state) {
    if (state == true) {
      isdark = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isdark = false;
      Get.changeTheme(ThemeData.light());
    }
    print("IsDark ${isdark}");
    ThemeCatch.instance.saveUserTheme(isdark);
    update();
  }
}
