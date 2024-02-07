import 'package:get/get.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';
// import 'package:hotel/controller/search_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put hear
    Get.put(NavigationController());
    // Get.put(FindController());
  }
}
