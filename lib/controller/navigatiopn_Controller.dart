import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/Profile/profile.dart';
import 'package:hotel/view/booking/booking_screen.dart';
import 'package:hotel/view/home/home_screen.dart';

import '../view/search/Search_screen.dart';

class NavigationController extends GetxController {
  final curentindex = 0.obs;
  var listpage = [HomeScreen(), SearchScreen(), BookingScreen(), ProFile()];

  PageController pageController = PageController();

  void page(int indexchange) {
    curentindex(indexchange);
    pageController.jumpToPage(indexchange);
  }
}
