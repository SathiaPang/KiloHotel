import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
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
      print("===========>>>>>>> ${res.status}");
      if (res.status == 200) {
        print("=================================> $res.data");
        profileModel.value = res;
        update();
        isLoading.value = true;
      }
    } on DioException catch (e) {
      print(e.message);
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
}
