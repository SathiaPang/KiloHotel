import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

class TotalGuest extends StatelessWidget {
  TotalGuest({
    super.key,
    required this.text,
    required this.onpressAdd,
    required this.onpressREmove,
  });

  final String text;
  VoidCallback onpressAdd;
  VoidCallback onpressREmove;

  @override
  Widget build(BuildContext context) => Container(
        height: Get.height / 13,
        width: Get.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: boxcolor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: Get.width / 7.5,
              decoration: BoxDecoration(
                  color: greenAccent, borderRadius: BorderRadius.circular(13)),
              child: Center(
                child: IconButton(
                    onPressed: onpressREmove,
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                    )),
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: Get.width / 7.5,
              decoration: BoxDecoration(
                  color: greenAccent, borderRadius: BorderRadius.circular(13)),
              child: Center(
                child: IconButton(
                    onPressed: onpressAdd,
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    )),
              ),
            ),
          ],
        ),
      );
}
