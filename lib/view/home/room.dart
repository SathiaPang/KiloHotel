import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class RoomView extends StatelessWidget {
  RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: Get.height / 2,
          width: Get.width / 1.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: AssetImage("assets/images/hotel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 200),
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), color: green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: white,
                      ),
                      Text(
                        '5.0',
                        style: TextStyle(color: white),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  'Intercontine Hotel',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  'Lagos,Nigeria',
                  style: TextStyle(color: white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '\$ 205',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      TextSpan(text: " /night")
                    ])),
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border_outlined,
                        color: white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
