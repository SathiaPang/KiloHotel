import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class BookDetailScreenOne extends StatefulWidget {
  const BookDetailScreenOne({Key? key}) : super(key: key);

  @override
  State<BookDetailScreenOne> createState() => _BookDetailScreenOneState();
}

class _BookDetailScreenOneState extends State<BookDetailScreenOne> {
  final List<String> imageUrls = [
    'https://images.rosewoodhotels.com/is/image/rwhg/RWPPN_grand-premier-room:WIDE-MEDIUM-4-3',
    'https://media.cnn.com/api/v1/images/stellar/prod/140127103345-peninsula-shanghai-deluxe-mock-up.jpg?q=w_2226,h_1449,x_0,y_0,c_fill',
    'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
    'https://imageio.forbes.com/specials-images/imageserve/5cdb058a5218470008b0b00f/Nobu-Ryokan-Malibu/0x0.jpg?format=jpg&height=1009&width=2000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.45,
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        print("ohh you touch me tal la la");
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/hotel.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      "Presidential Hotel",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: RichText(
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
                  ),
                  SizedBox(height: 20),
                  line(),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gallery Photos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
                  SizedBox(height: 10),
                  //Carousal Image
                  Container(
                    height: 120, // Set a fixed height for the ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DetailIcon(
                        text: 'Hotel',
                        icon: CupertinoIcons.building_2_fill,
                      ),
                      DetailIcon(
                        text: '4 Bedrooms',
                        icon: CupertinoIcons.bed_double,
                      ),
                      DetailIcon(
                        text: '2 Bathrooms',
                        icon: Icons.shower_outlined,
                      ),
                      DetailIcon(
                        text: '3000sqft',
                        icon: Icons.square_foot,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text:
                              'Before we dive into the specifics of the Text widget, let’s first understand why it’s important to be able to display and style text in a Flutter app. \tText is a crucial part of any user interface, as it allows us to convey information to the user.',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.4,
                              height: 1.4),
                        ),
                        TextSpan(
                          text: '',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Facilities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FacilitiesIcon(
                          text: 'Meeting Room',
                          icon: Icons.meeting_room,
                        ),
                        FacilitiesIcon(
                          text: 'Fitness Center',
                          icon: Icons.fitness_center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: FacilitiesIcon(
                            text: 'Elevator',
                            icon: Icons.elevator,
                          ),
                        ),
                        FacilitiesIcon(
                          text: '24-hours Open',
                          icon: Icons.schedule,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 10.0,
                    ),
                    child: Container(
                      height: Get.height * 0.25,
                      width: Get.width * 1,
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/images/map.png',
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
                  SizedBox(height: 10),
                  Container(
                    height: Get.height * 0.7,
                    color: greenAccent,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: Get.width * 0.4,
                              child: Column(
                                children: [
                                  Row(
                                    children: [],
                                  )
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
}
