import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: white,
        title: Row(
          children: [
            Container(
              height: Get.height / 20,
              width: Get.width / 12,
              decoration: BoxDecoration(
                  // color: green,
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Bolu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),

        // Action
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline,
                size: 30,
              )),
        ],
      ),
      body: Column(
        children: [
          //
          _builNickName()
        ],
      ),
    );
  }

  Widget _builNickName() => Padding(
        padding: const EdgeInsets.only(top: 5, left: 15),
        child: Row(
          children: [
            Text(
              "Hello, So LayZz",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
