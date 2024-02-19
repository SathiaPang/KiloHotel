import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/constant.dart';
import 'package:hotel/view/Profile/payment.dart';
import 'package:hotel/view/dialogPayment/dialogPayment.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenAccent,
      appBar: AppBar(
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: Get.height / 20,
                  width: Get.width / 12,
                  decoration: BoxDecoration(
                      // color: green,
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "My Booking",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildTabbar(),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: _buildListOnGoing(context),
              );
            },
          ))
        ],
      ),
    );
  }

  Widget _buildTabbar() => DefaultTabController(
      length: 3,
      child: Container(
        height: 75,
        color: white,
        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
          indicatorWeight: 2.0,
          tabs: [
            Tab(
              text: "On Going",
            ),
            Tab(
              text: "Complete",
            ),
            Tab(
              text: "Canceled",
            )
          ],
        ),
      ));

  Widget _buildListOnGoing(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: Get.height / 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/hotel.jpg'), // Corrected path
                          fit: BoxFit.cover, // Specify the fit
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Internation Hotela',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'New  York, USA',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: greenAccent),
                            child: Text(
                              'Paid',
                              style: TextStyle(color: green),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 10,
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(context, text: 'Cancel Booking',
                        onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            height: Get.height / 3,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cancel Booking',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  width: Get.width / 1.1,
                                  color: black,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Are you sure you want to cancel your \n hotel bookings?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    'Only 80% of the money you can refund from your payment according to our policy',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [_buildcancel(), _buildyes()],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }, color: white, colorside: green, txtcolor: green),
                    SizedBox(
                      width: 10,
                    ),
                    _buildButton(
                      context,
                      text: 'View Ticket',
                      onPressed: () {
                        Get.to(PaymentBooking());
                        // Get.dialog(DialogPayMent());
                      },
                      txtcolor: white,
                      color: green,
                      colorside: green,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildButton(
    BuildContext context, // Move the curly brace here
    {
    required String text,
    required VoidCallback onPressed,
    required Color txtcolor,
    required Color color,
    required Color colorside,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: colorside, width: 2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            color: txtcolor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildListComplete() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: Get.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/hotel.jpg'), // Corrected path
                          fit: BoxFit.cover, // Specify the fit
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Internation Hotela',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'New  York, USA',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: greenAccent),
                            child: Text(
                              'Completed',
                              style: TextStyle(color: green),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: green,
                        ),
                        child: Icon(
                          Icons.done,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "yay.you have completeit!",
                        style: TextStyle(color: green),
                      ) // Using a different icon for priority
                    ],
                  ),
                )

                // Spacer(),
              ],
            ),
          ),
        ),
      );

  Widget _buildListCanceled() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: Get.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/hotel.jpg'), // Corrected path
                          fit: BoxFit.cover, // Specify the fit
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Internation Hotela',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'New  York, USA',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(127, 255, 161, 161)),
                            child: Text(
                              'Canceled & Refunded',
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(127, 255, 161, 161),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red,
                        ),
                        child: Icon(
                          Icons.priority_high,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "yay.you have completeit!",
                        style: TextStyle(color: Colors.red),
                      ) // Using a different icon for priority
                    ],
                  ),
                )

                // Spacer(),
              ],
            ),
          ),
        ),
      );
}

Widget _buildcancel() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(160, 40),
          backgroundColor: Colors.green.shade100,
        ),
        onPressed: () {
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(color: green, fontSize: 17),
          ),
        ),
      ),
    );
Widget _buildyes() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(170, 40),
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'Yes, Continue',
            style: TextStyle(color: white, fontSize: 17),
          ),
        ),
      ),
    );
