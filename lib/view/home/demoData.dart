import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/text.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/home_controller.dart';

class DemoData extends StatelessWidget {
  DemoData({super.key});
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return _buildData();
  }

  Widget _buildData() => Obx(
        () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homeController.listDatum.length,
            itemBuilder: (context, index) {
              final data = homeController.listDatum[index];
              print("====> Image ====> ${data.image}");
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.bookindeDetail, arguments: data);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Container(
                          height: Get.height / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "${data.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : data.image.first['url']}",
                                  ),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(1, 1),
                                ),
                              ]),
                          child: Column(
                            children: [
                              // Rating star
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Container(
                                      height: Get.height / 23,
                                      width: Get.width / 5,
                                      decoration: BoxDecoration(
                                          color: green,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
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
                                ],
                              ),
                              // Information
                              Spacer(),
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          black.withOpacity(0.10),
                                          black
                                        ]),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextEdit(
                                        color: white,
                                        size: 25,
                                        text: data.title.toString(),
                                        fontWeight: FontWeight.w800,
                                      ),
                                      TextEdit(
                                        color: white,
                                        size: 15,
                                        text: "Bed: ${data.bed}",
                                        fontWeight: FontWeight.w800,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "\$ ${data.price} /night",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )));
            }),
      );
}
