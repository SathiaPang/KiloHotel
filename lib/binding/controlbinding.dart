import 'package:get/get.dart';
import 'package:hotel/controller/naviga_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put hear
    Get.put(NavigaController());
  }
}
