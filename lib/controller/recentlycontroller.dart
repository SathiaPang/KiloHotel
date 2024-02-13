import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class RecentlyController extends GetxController {
  final RxBool isGridVisible = false.obs;
  final Rx<Color> iconColor = Colors.green.obs;

  void toggleView() {
    isGridVisible.value = false;
    update();
    updateColor();
  }

  void showGridView() {
    isGridVisible.value = true;
    update();
    updateColor();
  }

  void updateColor() {
    iconColor.value = isGridVisible.value ? Colors.black : Colors.green;
  }
}
