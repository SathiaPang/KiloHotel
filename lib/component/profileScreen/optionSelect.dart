import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionSelect extends StatelessWidget {
  const OptionSelect(
      {super.key,
      required this.icon,
      required this.text,
      required this.size,
      required this.ontap
      // required this.onTap
      });

  final String text;
  final IconData? icon;
  final double size;
  final VoidCallback ontap;

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
                  fontSize: size,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
