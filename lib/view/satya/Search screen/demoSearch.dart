import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/data/data.dart';

class DemoSearch extends StatelessWidget {
  const DemoSearch({super.key, required this.hotelList});

  final List<Hotel> hotelList;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: hotelList.length,
        itemBuilder: (context, index) {
          //final data = hotelList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height * 0.1,
              width: Get.width * 0.5,
              color: green,
              
            ),
          );
        },
      ),
    );
  }
}
