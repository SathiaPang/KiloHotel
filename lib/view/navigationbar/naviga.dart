import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});

  final NavigationController _navigacontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _navigacontroller.pageController,
        children: _navigacontroller.listpage,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: _navigacontroller.curentindex.value,
            elevation: 0,
            selectedItemColor: green,
            unselectedItemColor: black,
            backgroundColor: white,
            onTap: (value) {
              _navigacontroller.page(value);
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
                  label: "")
            ]),
      ),
    );
  }
}
