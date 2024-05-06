import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/bookingDetail_controller.dart';
import 'package:hotel/model/room_model.dart';

class BookDetailScreenOne extends StatefulWidget {
  BookDetailScreenOne({Key? key}) : super(key: key);

  @override
  State<BookDetailScreenOne> createState() => _BookDetailScreenOneState();
}

class _BookDetailScreenOneState extends State<BookDetailScreenOne> {
  final BookingDetailController bookingDetailController = Get.find();
  final Datum datum = Get.arguments;
  @override
  void initState() {
    bookingDetailController.getDetailData(datum.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildBookingNow(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: Row(
          children: [
            Container(
              height: Get.height / 20,
              width: Get.width / 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Room Detail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: Get.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${datum.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : datum.image.first['url']}"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${datum.title}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Icon(
                            Icons.location_on_rounded,
                            color: green,
                            size: 19,
                          ),
                        ),
                        TextSpan(
                          text: '12 Eze Adele Road Rumuomasi Lagos Nigeria',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  line(),
                  SizedBox(height: 10),
                  Text(
                    "Gallery Photos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 180,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "${datum.image.isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : datum.image.first['url']}",
                                      ),
                                      fit: BoxFit.fitHeight),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("${datum.description}"),
                  SizedBox(height: 5),
                  Text(
                    "Amentity",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("${datum.amenity}"),
                  Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FacilitiesIcon(
                        text: 'Swimming Pool',
                        icon: Icons.pool,
                      ),
                      FacilitiesIcon(
                        text: 'WiFi',
                        icon: Icons.wifi,
                      ),
                      FacilitiesIcon(
                        text: 'Restaurant',
                        icon: Icons.local_dining,
                      ),
                      FacilitiesIcon(
                        text: 'Parking',
                        icon: Icons.local_parking,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FacilitiesIcon(
                        text: 'Meeting Room',
                        icon: Icons.meeting_room,
                      ),
                      FacilitiesIcon(
                        text: 'Fitness Center',
                        icon: Icons.fitness_center,
                      ),
                      FacilitiesIcon(
                        text: 'Elevator',
                        icon: Icons.elevator,
                      ),
                      FacilitiesIcon(
                        text: '24-hours Open',
                        icon: Icons.schedule,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Review ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                              text: '5.0 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: green,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: '(4,345 Reviews)',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: green,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: Get.height * 0.9,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Container(
                              height: Get.width * 0.4,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15.0),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              'assets/images/pf.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Keat Panha",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "Jan 20, 2025",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Container(
                                          width: Get.width * 0.18,
                                          height: Get.height * 0.042,
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                ),
                                                children: <InlineSpan>[
                                                  WidgetSpan(
                                                    child: Icon(
                                                      Icons.star,
                                                      color: white,
                                                      size: 21,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: '5.0',
                                                    style: TextStyle(
                                                        color: white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: green,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: Get.width * 0.8,
                                    height: Get.height * 0.08,
                                    child: Text(
                                      "Very nice and comfortable hotel, thank you for accompanying my vacation!",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget DetailIcon({
    required String text,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: green,
            size: 35,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget FacilitiesIcon({
    required String text,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: green,
          size: 35,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }

  Container line() {
    return Container(
      height: 0.5,
      width: double.infinity,
      color: Colors.black,
    );
  }

  Widget _buildBookingNow() => ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: green, minimumSize: Size(200, 60)),
      onPressed: () {
        Get.toNamed(AppRoute.selectDate, arguments: datum);
      },
      child: Text(
        "Booking Now!",
        style:
            TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: 18),
      ));
}
