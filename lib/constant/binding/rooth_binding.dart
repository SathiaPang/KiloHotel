import 'package:get/get.dart';
import 'package:hotel/controller/homeScreenController.dart';
import 'package:hotel/response/user_repo.dart';
import 'package:hotel/response/user_reponse.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRespoitory());
    Get.put(UserRepo());
    Get.put(ProfileScreenController(userRepo: Get.find()));
  }
}
