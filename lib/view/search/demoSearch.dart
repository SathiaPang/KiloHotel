import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/controller/search_controller.dart';

class DemoSearch extends StatelessWidget {
  DemoSearch({
    super.key,
  });

  final HomeController _homeController = Get.find();
  final SearchDataController _searchDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _searchDataController.dataRoom.length,
      itemBuilder: (context, index) {
        final data = _searchDataController.dataRoom[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: InkWell(
            onTap: () => Get.toNamed(AppRoute.bookindeDetail, arguments: data),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: greenAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${data.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : data.image.first['url']}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${data.title}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: green),
                              ),
                              Spacer(),
                              Text(
                                "\$ ${data.price}",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("/night")
                            ],
                          ),
                          Row(
                            children: [
                              Text("Bed :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                data.bed.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          // Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '5.0',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.green),
                              ),
                              Text("(4,345 reviews)"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
