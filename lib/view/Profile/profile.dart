import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/view/Profile/editprofile.dart';
import 'package:hotel/view/Profile/notificationScreen.dart';
import 'package:hotel/view/Profile/security.dart';
import 'package:hotel/view/booking/recently.dart';
import 'package:hotel/view/soklay/payment1.dart';

class ProFile extends StatefulWidget {
  ProFile({super.key});

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _switchValue ? black : white,
      appBar: AppBar(
        backgroundColor: _switchValue ? black : white,
        centerTitle: false,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: _switchValue ? white : black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.pending_outlined,
                  size: 25, color: _switchValue ? white : black))
        ],
      ),
      body: Column(
        children: [
          //
          _buildPicture(),
          _builNameAndGmail(),
          _buildEditPF(),
          _buildPayment(),
          _buildNotification(),
          _buildSecurity(),
          _buildHelp(),
          _builDarkTheme(),
          _buildLogout()
        ],
      ),
    );
  }

  Widget _buildPicture() => Center(
        child: CircleAvatar(
          radius: 70,
          // backgroundColor: green,
          backgroundImage: AssetImage("assets/images/pf.png"),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 110),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: white,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _builNameAndGmail() => ListView(
        shrinkWrap: true,
        children: [
          //
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "So LayZz",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: _switchValue ? white : black),
          )),
          Center(
              child: Text(
            "Kremsoklay@gmail.com",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: _switchValue ? white : black),
          )),
        ],
      );

  Widget _buildEditPF() => Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(EditPF());
              },
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(Icons.person_2_outlined,
                        size: 30, color: _switchValue ? white : black),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: _switchValue ? white : black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildPayment() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            //
            InkWell(
              onTap: () {
                Get.to(PayMent1());
              },
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(Icons.payment_outlined,
                        size: 30, color: _switchValue ? white : black),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Payment",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: _switchValue ? white : black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildNotification() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            //
            InkWell(
              onTap: () {
                Get.to(NotiScreen());
              },
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(Icons.notifications_none,
                        size: 30, color: _switchValue ? white : black),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: _switchValue ? white : black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildSecurity() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            //
            InkWell(
              onTap: () {
                Get.to(SecurityScreen());
              },
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(Icons.verified_user_outlined,
                        size: 30, color: _switchValue ? white : black),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Security",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: _switchValue ? white : black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildHelp() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            //
            InkWell(
              onTap: () {
                Get.to(RecentlyScreen());
              },
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(Icons.help_outline,
                        size: 30, color: _switchValue ? white : black),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: _switchValue ? white : black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _builDarkTheme() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            //
            Container(
              height: Get.height / 25,
              width: Get.width / 1,
              // color: green,
              child: Row(
                children: [
                  //
                  SizedBox(
                    width: 13,
                  ),
                  Icon(Icons.visibility_outlined,
                      size: 30, color: _switchValue ? white : black),

                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "Dark Theme",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: _switchValue ? white : black),
                  ),

                  Spacer(),
                  CupertinoSwitch(
                      activeColor: _switchValue ? white : black,
                      trackColor: _switchValue ? white : black,
                      thumbColor: _switchValue ? black : white,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildLogout() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: Get.height / 3,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                      Container(
                        height: 1,
                        width: Get.width / 1.2,
                        color: black,
                      ),
                      Text(
                        'Are you sure you want to logout from \n your account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      _buildyes(),
                      _buildcancel()
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              //
              Container(
                height: Get.height / 25,
                width: Get.width / 2,
                // color: green,
                child: Row(
                  children: [
                    //
                    SizedBox(
                      width: 13,
                    ),
                    Icon(
                      Icons.login_outlined,
                      size: 30,
                      color: Colors.redAccent,
                    ),

                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  // Widget _buildBottomSheetApp(BuildContext context) {
  //   return ElevatedButton(
  //     child: const Text('showModalBottomSheet'),
  //     onPressed: () {
  //       showModalBottomSheet<void>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return Container(
  //             decoration:
  //                 BoxDecoration(borderRadius: BorderRadius.circular(15)),
  //             height: Get.height / 3,
  //             width: double.infinity,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   'Cancel Booking',
  //                   style: TextStyle(
  //                       color: Colors.red,
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 22),
  //                 ),
  //                 Container(
  //                   height: 1,
  //                   width: Get.width / 1.2,
  //                   color: black,
  //                 ),
  //                 Text(
  //                   'Are you sure you want to cancel your \n hotel bookings?',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(fontSize: 18),
  //                 ),
  //                 _buildyes(),
  //                 _buildcancel()
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Widget _buildcancel() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(275, 60),
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
            fixedSize: Size(275, 60),
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            // Get.to(Login());
          },
          child: Center(
            child: Text(
              'Yes, Logout',
              style: TextStyle(color: white, fontSize: 17),
            ),
          ),
        ),
      );
}
