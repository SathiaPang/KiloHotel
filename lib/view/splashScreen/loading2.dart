import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/controller/homeScreenController.dart';
import 'package:hotel/controller/login_controller.dart';
import 'package:hotel/local/local.dart';

class Loading2 extends StatefulWidget {
  Loading2({super.key});

  @override
  State<Loading2> createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
  @override
  void initState() {
    Future.microtask(() => initLoading());
    super.initState();
    Get.find<ProfileScreenController>().getPrfileData();
  }

  void initLoading() async {
    final LoginController loginController = Get.find();
    loginController.isLogin();
    final token =
        await LocalStorageManager.instance.getFromCache(ServerRout.keyToken);

    Timer(
      const Duration(seconds: 1),
      () {
        if (token != null && token.isNotEmpty) {
          print("===>> Login $token");

          Get.offNamed(AppRoute.bottomNavigation);
        } else {
          Get.offNamed(AppRoute.signin);
          print("===>> NotLogin $token");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: Column(
          children: [
            Image.asset("assets/images/blogo.jpg"),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5.5,
            ),
          ],
        ),
      ),
    );
  }
}
