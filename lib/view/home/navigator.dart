import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/controller/navigaController.dart';
import 'homeScreen.dart';

class NavigatorScreen extends StatelessWidget {
  NavigatorScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final navigatorController = Get.put(NavigatorController());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: GetBuilder<NavigatorController>(
        builder: (controller) => CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 50,
          animationDuration: Duration(milliseconds: 300),
          items: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.search, 'Search', 1),
            _buildNavItem(Icons.library_books_outlined, 'Booking', 2),
            _buildNavItem(Icons.person, 'Profile', 3),
          ],
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          index: controller.selectedIndex.value,
        ),
      ),
      body: Obx(() =>
          navigatorController.screens[navigatorController.selectedIndex.value]),
    );
  }
}

Widget _buildNavItem(IconData icon, String text, int index) {
  return GestureDetector(
    onTap: () {
      final navigatorController = Get.find<NavigatorController>();
      navigatorController.selectedIndex.value = index;
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 20,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.green,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
