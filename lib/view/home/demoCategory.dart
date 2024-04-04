import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/text.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/home_controller.dart';

class DemoCategory extends StatelessWidget {
  DemoCategory({super.key});

  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.listDatum.length,
        itemBuilder: (context, index) {
          final data = homeController.listDatum[index];
          print("====> Image ====> ${data.image}");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.bookindeDetail, arguments: data);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: Get.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                            "${data.image.isEmpty ? "" : data.image.firstOrNull}",
                          ),
                          fit: BoxFit.fitHeight),
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.solid,
                            offset: Offset(8, 8),
                            color: black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5)
                      ]),
                  child: Column(
                    children: [
                      // Rating star
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Container(
                              height: Get.height / 23,
                              width: Get.width / 5,
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: white,
                                  ),
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_outline,
                                color: white,
                                size: 40,
                              ))
                        ],
                      ),
                      // Information
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextEdit(
                                      color: white,
                                      size: 25,
                                      text: data.title.toString()),
                                  TextEdit(
                                      color: white,
                                      size: 17,
                                      text: data.subTitle.toString()),
                                  TextEdit(
                                      color: white,
                                      size: 17,
                                      text: "Bed: ${data.bed}"),
                                  TextEdit(
                                      color: white,
                                      size: 17,
                                      text: "Adult: ${data.adult}"),
                                  RichText(
                                    text: TextSpan(
                                      text: "\$ ${data.price} /night",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
