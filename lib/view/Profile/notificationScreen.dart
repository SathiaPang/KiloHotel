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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
          ],
        ),
      ),
    );
  }

  Widget _builGeneralNotification() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "gerneral".tr,
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
            "sound".tr,
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
            "vibrate".tr,
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
            'update'.tr,
            style: TextStyle(color: white, fontSize: 17),
          ),
        ),
      );
}
