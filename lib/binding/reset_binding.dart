import 'package:get/get.dart';
import 'package:hotel/controller/resetPassword_controller.dart';

class resetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController(resetResponse: Get.find()));
  }
}
