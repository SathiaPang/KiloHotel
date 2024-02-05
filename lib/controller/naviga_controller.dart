import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel/view/booking/booking_screen.dart';
import 'package:hotel/view/home/homepage.dart';
import 'package:hotel/view/search/search_page.dart';
import 'package:hotel/view/soklay/profile.dart';

class NavigaController extends GetxController {
  final curentindex = 0.obs;
  var listpage = [HomePage(), SearchPage(), BookingScreen(), ProFile()];

  PageController pageController = PageController();

  void page(int indexchange) {
    curentindex(indexchange);
    pageController.jumpToPage(indexchange);
  }
}
