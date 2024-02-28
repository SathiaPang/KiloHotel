import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

class OptionSelect extends StatelessWidget {
  const OptionSelect(
      {super.key,
      required this.icon,
      required this.text,
      required this.color,
      required this.size,
      required this.ontap
      // required this.onTap
      });

  final String text;
  final IconData? icon;
  final Color color;
  final int size;
  final VoidCallback ontap;

  // final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          height: Get.height / 25,
          width: Get.width / 2,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 19, fontWeight: FontWeight.w500, color: black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
