import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/homeScreenController.dart';

class DetailProfileImageScreen extends StatelessWidget {
  DetailProfileImageScreen({super.key});

  final ProfileScreenController _profileScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            alignment: Alignment.center,
            child: Image.network(
              "${_profileScreenController.profileModel.value!.data!.avatar.toString()}",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 5,
            top: 40,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
