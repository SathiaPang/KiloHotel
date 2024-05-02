import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/controller/recentlycontroller.dart';
import 'package:hotel/constant/constant.dart';

class RecentlyScreen extends StatefulWidget {
  RecentlyScreen({super.key});

  @override
  State<RecentlyScreen> createState() => _RecentlyScreenState();
}

class _RecentlyScreenState extends State<RecentlyScreen> {
  final Rx<Color> iconColor = Colors.black.obs;
  final RecentlyController controller = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenAccent,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Recently Booked",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Obx(
              () => Icon(
                Icons.menu,
                color: controller.click.value ? green : black,
              ),
            ),
            onPressed: () {
              controller.toggleView();
            },
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                Icons.grid_view_outlined,
                color: controller.click.value ? black : green,
              ),
            ),
            onPressed: () {
              controller.showGridView();
            },
          ),
        ],
      ),
      body: GetBuilder<RecentlyController>(
        init: RecentlyController(),
        builder: (controller) {
          return controller.isGridVisible.value
              ? _buildGridList(iconColor)
              : _buildStackList(iconColor);
        },
      ),
    );
  }

  Widget _buildStackList(Rx<Color> iconColor) => ListView.builder(
        itemCount: _homeController.listDatum.length,
        itemBuilder: (context, index) {
          final dataApi = _homeController.listDatum[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AppRoute.bookindeDetail, arguments: dataApi),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: green),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              "${dataApi.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : dataApi.image.first['url']}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${dataApi.title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: green),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$ ${dataApi.price}",
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
                                    dataApi.bed.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
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
                                  Spacer(),
                                  Obx(
                                    () => IconButton(
                                      onPressed: () {
                                        iconColor.value =
                                            iconColor.value == Colors.black
                                                ? Colors.green
                                                : Colors.black;
                                      },
                                      icon: Icon(Icons.bookmark),
                                      color: iconColor.value,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

  Widget _buildGridList(Rx<Color> iconColor) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 230,
              crossAxisSpacing: 2,
              childAspectRatio: 1 / 1.3,
              mainAxisSpacing: 10),
          itemCount: _homeController.listDatum.length,
          itemBuilder: (context, index) {
            final dataApi = _homeController.listDatum[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(AppRoute.bookindeDetail, arguments: dataApi),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: green),
                    color: white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                "${dataApi.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : dataApi.image.first['url']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${dataApi.title}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: green),
                            ),
                            Spacer(),
                            Obx(
                              () => IconButton(
                                onPressed: () {
                                  iconColor.value =
                                      iconColor.value == Colors.black
                                          ? Colors.green
                                          : Colors.black;
                                },
                                icon: Icon(Icons.bookmark),
                                color: iconColor.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Bed :",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              dataApi.bed.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ ${dataApi.price}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("/night")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
