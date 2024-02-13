import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/data/data.dart';

class DemoCategory extends StatelessWidget {
  const DemoCategory({super.key, required this.hotelList});

  final List<Hotel> hotelList;
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotelList.length,
        itemBuilder: (context, index) {
          final data = hotelList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              width: Get.width / 1.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("${data.img}"), fit: BoxFit.fitHeight)),
            ),
          );
        }));
  }
}
