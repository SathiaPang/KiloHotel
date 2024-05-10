import 'dart:ffi';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/local/local.dart';
import 'package:hotel/model/getprofile_model.dart';
import 'package:hotel/response/user_repo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  UserRepo userRepo;
  ProfileScreenController({required this.userRepo});

  @override
  void onInit() {
    super.onInit();
    getPrfileData();
  }

  Rx<bool> isLoading = false.obs;
  Rx<ProfileModel?> profileModel = Rx<ProfileModel?>(null);

  void getPrfileData() async {
    try {
      final res = await userRepo.getProfileData();
      if (res.status == 200) {
        profileModel.value = res;
        isLoading.value = true;
      }
    } on DioException catch (e) {
      print("=================================>>>>>>> ${e.message}");
    }
  }

  void clearToken() {
    LocalStorageManager.instance.clearToken(ServerRout.keyToken);
    Get.offNamed(AppRoute.login);
  }

  void pickImageAndUploadsGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    File file = File(image!.path);
    try {
      final res = await userRepo.uploadProfileImage(file);
      if (res['status'] == 200) {
        getPrfileData();
      }
      print("Image uploaded successfully");
    } on DioException catch (e) {
      print("Failed to upload image: ${e.response?.data.toString()}");
    }
  }

  void pickImageAndUploadsCamera() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    File file = File(image!.path);
    try {
      final res = await userRepo.uploadProfileImage(file);
      if (res['status'] == 200) {
        getPrfileData();
      }
      print("Image uploaded successfully");
    } on DioException catch (e) {
      print("Failed to upload image: ${e.response?.data.toString()}");
    }
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      // backgroundColor: greenAccent,
      context: context,
      builder: (builder) {
        return SizedBox(
          width: Get.width / 0.5,
          height: Get.height / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  pickImageAndUploadsCamera();
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_enhance_outlined,
                        size: 35,
                      ),
                      Text("Camera"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pickImageAndUploadsGallery();
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 35,
                        // color: black,
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
