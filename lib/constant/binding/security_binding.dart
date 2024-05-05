import 'package:get/get.dart';
import 'package:hotel/controller/security_controller.dart';

class SecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecurityController());
  }
}
