import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';

class SecurityController extends GetxController {
  var faceID = false.obs;
  var rememberMe = false.obs;
  var touchID = false.obs;
}

class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});
  final SecurityController _securityController = Get.put(SecurityController());
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
            SizedBox(height: 30),
            _buildBottomSheetApp(context),
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
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'Change Password',
            style: TextStyle(color: green, fontSize: 17),
          ),
        ),
      );

  Widget _buildBottomSheetApp(BuildContext context) {
    return ElevatedButton(
      child: const Text('showModalBottomSheet'),
      onPressed: () {
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
                    'Cancel Booking',
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
                    'Are you sure you want to cancel your \n hotel bookings?',
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
    );
  }

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
