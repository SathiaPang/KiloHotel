import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class ProFile extends StatefulWidget {
  ProFile({super.key});

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  bool _switchValue = true;

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
          ],
        ),
      );

  Widget _buildPayment() => Padding(
        padding: const EdgeInsets.only(top: 15),
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
          ],
        ),
      );

  Widget _buildNotification() => Padding(
        padding: const EdgeInsets.only(top: 15),
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
          ],
        ),
      );

  Widget _buildSecurity() => Padding(
        padding: const EdgeInsets.only(top: 15),
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
          ],
        ),
      );

  Widget _buildHelp() => Padding(
        padding: const EdgeInsets.only(top: 15),
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
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
