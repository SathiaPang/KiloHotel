import 'package:get/get.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put hear
    Get.put(NavigationController());
  }
}
