import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/search_controller.dart';
import 'package:hotel/model/room_model.dart';

class DemoSearch extends StatelessWidget {
  DemoSearch({
    super.key,
  });

  final SearchDataController _searchDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Datum>>(
        future: _searchDataController.searchByTitle(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.bookindeDetail,
                        arguments: data![index]);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: greenAccent,
                          border: Border.all(width: 2, color: green)),
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
                                    "${data![index].image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : data?[index].image.first['url']}",
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
                                        '${data?[index].title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: green),
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$ ${data?[index].price}",
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
                                        "${data?[index].bed}",
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
        });
  }
}
