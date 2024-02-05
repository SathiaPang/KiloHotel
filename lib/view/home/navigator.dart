import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/naviga_controller.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  final NavigaController _navigaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _navigaController.pageController,
        children: _navigaController.listpage,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: white,
              currentIndex: _navigaController.curentindex.value,
              selectedItemColor: green,
              unselectedItemColor: black,
              elevation: 0,
              onTap: (value) {
                _navigaController.page(value);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                // Home
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    label: ""),

                // Search
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    label: ""),

                // Booking
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.article_outlined,
                      size: 30,
                    ),
                    label: ""),

                // Profile
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 30,
                    ),
                    label: ""),
              ])),
    );
  }
}
