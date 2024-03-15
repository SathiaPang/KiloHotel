import 'package:get/get.dart';
import 'package:hotel/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController(userRegisterRepository: Get.find()));
    // Get.lazyPut(() => LoginController());
  }
}
