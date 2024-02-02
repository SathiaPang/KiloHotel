import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import 'homeScreen.dart';

class Navigator extends StatefulWidget {
  const Navigator({Key? key}) : super(key: key);

  @override
  State<Navigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => NavigatorController()
          .screens[NavigatorController().selectedIndex.value]),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            backgroundColor: Colors.blue,
            color: Colors.deepPurple.shade100,
            animationDuration: Duration(microseconds: 200),
            onTap: (index) {
              NavigatorController().selectedIndex.value = index;
            },
            items: [
              Icon(
                Icons.home,
                color: white,
              ),
              Icon(
                Icons.search,
                color: white,
              ),
              Icon(
                Icons.menu_rounded,
                color: white,
              ),
              Icon(
                Icons.person_2_outlined,
                color: white,
              ),
            ],
          )),
    );
  }
}

class NavigatorController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),

    // Add other screens here
  ];
}
