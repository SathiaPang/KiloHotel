import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Settings & privacy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [_editPF(), _password()],
      ),
    );
  }

  Widget _editPF() => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.editPF);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _password() => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.changePassword);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
