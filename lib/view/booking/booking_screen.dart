import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel/constant.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenAccent,
      appBar: AppBar(
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  "My Booking",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _buildTabbar(),
        ],
      ),
    );
  }

  Widget _buildTabbar() => DefaultTabController(
      length: 3,
      child: Container(
        height: 75,
        color: white,
        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
          indicatorWeight: 2.0,
          
          tabs: [
            Tab(
              text: "On Going",
            ),
            Tab(
              text: "Complete",
            ),
            Tab(
              text: "Canceled",
            )
          ],
        ),
      ));
}
