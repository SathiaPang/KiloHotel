import 'package:get/get.dart';
import 'package:hotel/controller/login_controller.dart';
import 'package:hotel/response/user_reponse.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRespoitory);
    Get.put(LoginController(userRespoitory: Get.find()));
  }
}
