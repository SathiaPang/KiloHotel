import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/profileScreen/optionSelect.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/theme_controller.dart';
import 'package:hotel/view/Profile/viewImageDetail.dart';
import '../../controller/homeScreenController.dart';

class ProFile extends StatefulWidget {
  ProFile({super.key});

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  final ProfileScreenController _profileScreenController = Get.find();
  final ThemeController _themeController = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "profile".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.pending_outlined, size: 25))
          ],
        ),
        body: Obx(
          () => _profileScreenController.isLoading.value
              ? Column(
                  children: [
                    _buildPicture(),
                    _builNameAndGmail(),
                    SizedBox(
                      height: 20,
                    ),
                    _setting(),
                    _notification(),
                    _security(),
                    _builDarkTheme(),
                    _buildLogout()
                  ],
                )
              : CircleAvatar(),
        ));
  }

  Widget _buildPicture() => Center(
        child: InkWell(
          onDoubleTap: () {
            Get.to(DetailProfileImageScreen());
          },
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(_profileScreenController
                .profileModel.value!.data!.avatar
                .toString()),
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
                  child: InkWell(
                    onTap: () {
                      _profileScreenController.showImagePickerOption(context);
                    },
                    child: Icon(
                      Icons.edit,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _builNameAndGmail() => ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            _profileScreenController.profileModel.value!.data!.name.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            _profileScreenController.profileModel.value!.data!.email.toString(),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          )),
        ],
      );

  Widget _setting() => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.setting);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "setting".tr,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _notification() => Row(
        children: [
          OptionSelect(
              ontap: () => Get.toNamed(AppRoute.notification),
              icon: Icons.notifications_none_rounded,
              text: "notification".tr,
              size: 19)
        ],
      );

  Widget _security() => Row(
        children: [
          OptionSelect(
              ontap: () => Get.toNamed(AppRoute.security),
              icon: Icons.verified_user_outlined,
              text: "security".tr,
              size: 19)
        ],
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
                  Icon(Icons.visibility_outlined, size: 30),

                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    "theme".tr,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Spacer(),
                  GetBuilder<ThemeController>(
                      builder: (_) => CupertinoSwitch(
                          activeColor: white,
                          trackColor: black,
                          thumbColor: green,
                          value: _themeController.isdark,
                          onChanged: (value) {
                            setState(() {
                              _themeController.changeTheme(value);
                            });
                          }))
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildLogout() => Padding(
        padding: const EdgeInsets.only(top: 17),
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
                        'logout'.tr,
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
                        width: Get.width / 1.2,
                        color: black,
                      ),
                      SizedBox(
                        height: 10,
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

  Widget _buildcancel() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(275, 60),
            backgroundColor: Colors.green.shade100,
          ),
          onPressed: () {
            Get.back();
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
            _profileScreenController.clearToken();
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
