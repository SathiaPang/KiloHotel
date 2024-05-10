import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});

  final NavigationController _navigacontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _navigacontroller.pageController,
        children: _navigacontroller.listpage,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: greenAccent,
                blurRadius: 2,
              ),
            ],
          ),
          child: BottomNavigationBar(
              currentIndex: _navigacontroller.curentindex.value,
              selectedItemColor: green,
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
                  label: "home".tr,
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.article_outlined,
                      size: 30,
                    ),
                    label: "booking".tr),
                // Profile
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 30,
                    ),
                    label: "profile".tr)
              ]),
        ),
      ),
    );
  }
}
