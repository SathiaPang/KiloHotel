import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/resetPassword_controller.dart';
import 'package:hotel/response/resetpassword_respone.dart';

class SecurityController extends GetxController {
  var faceID = false.obs;
  var rememberMe = false.obs;
  var touchID = false.obs;
}

class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});
  final SecurityController _securityController = Get.put(SecurityController());
  final ResetPasswordController _resetPasswordController =
      Get.put(ResetPasswordController(
          resetResponse: ResetResponse(
    status: 0, // Example integer value for status
    message: "", // Example message string
    messageKey: "", // Example messageKey string
    data: null, // Example null value for data
    paging: null, // Example null value for paging
  )));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Security',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            _buildFaceID(),
            SizedBox(height: 10),
            _buildRememberme(),
            SizedBox(height: 10),
            _buildTouchID(),
            SizedBox(height: 10),
            _buildGoogleAuth(),
            SizedBox(height: 30),
            _buildChangePwBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildFaceID() => Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Face ID",
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
            "Touch ID",
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
            "Remember me",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          CupertinoSwitch(
              value: _securityController.rememberMe.value,
              onChanged: (value) {
                _securityController.rememberMe.value = value;
              })
        ],
      ));

  Widget _buildGoogleAuth() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Remember me",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: green,
          )
        ],
      );
  Widget _buildChangePwBtn() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(370, 60),
          backgroundColor: Colors.green.shade100,
        ),
        onPressed: () {
          Get.toNamed(AppRoute.changePassword);
          // Get.toNamed(AppRoute.login);
        },
        child: Center(
          child: Text(
            'Change Password',
            style: TextStyle(color: green, fontSize: 17),
          ),
        ),
      );
}
