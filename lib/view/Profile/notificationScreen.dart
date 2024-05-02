import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/notification_controller.dart';

class NotiScreen extends StatelessWidget {
  NotiScreen({super.key});

  final NotificationController _notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Notification',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      floatingActionButton: _signButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            _builGeneralNotification(),
            SizedBox(height: 10),
            _buildSound(),
            SizedBox(height: 10),
            _buildVibrate(),
            SizedBox(height: 10),
            _builAppUpdate(),
            SizedBox(height: 10),
            _builNewServiceAvailable(),
            SizedBox(height: 10),
            _builNewTipAvalible()
          ],
        ),
      ),
    );
  }

  Widget _builGeneralNotification() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "General Notification",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.generalNotification.value,
            onChanged: (value) {
              _notificationController.generalNotification.value = value;
            },
          )
        ],
      ));

  Widget _buildSound() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sound",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.sound.value,
            onChanged: (value) {
              _notificationController.sound.value = value;
            },
          )
        ],
      ));

  Widget _buildVibrate() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Vibrate",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.vibrate.value,
            onChanged: (value) {
              _notificationController.vibrate.value = value;
            },
          )
        ],
      ));

  Widget _builAppUpdate() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "App Update",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.appUpdate.value,
            onChanged: (value) {
              _notificationController.appUpdate.value = value;
            },
          )
        ],
      ));

  Widget _builNewServiceAvailable() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Service Available",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.newServiceAvailable.value,
            onChanged: (value) {
              _notificationController.newServiceAvailable.value = value;
            },
          )
        ],
      ));

  Widget _builNewTipAvalible() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Tips Available ",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
            activeColor: green,
            value: _notificationController.newTipAvailable.value,
            onChanged: (value) {
              _notificationController.newTipAvailable.value = value;
            },
          )
        ],
      ));

  Widget _signButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(350, 65),
          backgroundColor: green,
        ),
        onPressed: () {
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'Update',
            style: TextStyle(color: white, fontSize: 17),
          ),
        ),
      );
}
