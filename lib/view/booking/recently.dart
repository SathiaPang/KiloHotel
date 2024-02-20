import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/recentlycontroller.dart';

import '../../constant.dart';

class RecentlyScreen extends StatefulWidget {
  RecentlyScreen({super.key});

  @override
  State<RecentlyScreen> createState() => _RecentlyScreenState();
}

class _RecentlyScreenState extends State<RecentlyScreen> {
  final Rx<Color> iconColor = Colors.black.obs;

  final RecentlyController controller = Get.find();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<RecentlyController>(
          init: RecentlyController(), // Initialize the controller
          builder: (controller) {
            return controller.isGridVisible.value
                ? _buildGridList(iconColor)
                : _buildStackList(iconColor);
          },
        ),
      ),
    );
  }
}

Widget _buildStackList(Rx<Color> iconColor) => ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/images/hotel.jpg'),
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
                        Text(
                          'International Hotel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'New York, USA',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '5.0',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.green),
                            ),
                            SizedBox(width: 5),
                            Text("(4,345 reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$205",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("/night"),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            iconColor.value = iconColor.value == Colors.black
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
        );
      },
    );

Widget _buildGridList(Rx<Color> iconColor) => GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 1.2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: Get.height / 5,
                  width: Get.width / 1.5,
                  // width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hotel.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'International Hotel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '5.0',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'New York, USA',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$205 ',
                            style: TextStyle(
                                fontSize: Get.width / 20, color: green),
                          ),
                          TextSpan(
                            text: '/night',
                            style: TextStyle(
                                // fontSize: Get.width * 0.07,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          iconColor.value = iconColor.value == Colors.black
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
        );
      },
    );
