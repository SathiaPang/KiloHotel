import 'package:get/get.dart';
import 'package:hotel/controller/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(userRespoitory: Get.find()));
  }
}
