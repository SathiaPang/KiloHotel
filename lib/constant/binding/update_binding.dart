import 'package:get/get.dart';
import 'package:hotel/controller/updateProfile_controller.dart';

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateProfileController(userRespoitory: Get.find()));
  }
}
