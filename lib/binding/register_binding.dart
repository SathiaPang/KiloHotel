import 'package:get/get.dart';
import 'package:hotel/controller/register_controller.dart';
import 'package:hotel/response/register/register_response.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRegisterRepository());
    Get.put(RegisterController(userRegisterRepository: Get.find()));
    // Get.lazyPut(() => LoginController());
  }
}
