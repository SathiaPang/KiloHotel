import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/security_controller.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});
  final SecurityController _securityController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'security'.tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            _buildFaceID(),
            _buildRememberme(),
            _buildTouchID(),
            // _buildGoogleAuth(),
          ],
        ),
      ),
    );
  }

  Widget _buildFaceID() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "face".tr,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
              value: _securityController.faceID.value,
              onChanged: (value) {
                _securityController.faceID.value = value;
              })
        ],
      ));
  Widget _buildTouchID() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "touch".tr,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
              value: _securityController.touchID.value,
              onChanged: (value) {
                _securityController.touchID.value = value;
              })
        ],
      ));
  Widget _buildRememberme() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "remember".tr,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
              value: _securityController.rememberMe.value,
              onChanged: (value) {
                _securityController.rememberMe.value = value;
              })
        ],
      ));
}
