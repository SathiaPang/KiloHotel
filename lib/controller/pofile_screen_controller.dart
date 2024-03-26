import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/model/getprofile_model.dart';
import 'package:hotel/response/user_repo.dart';

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
        update();
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
