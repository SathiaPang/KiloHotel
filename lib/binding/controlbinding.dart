import 'package:get/get.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';
import 'package:hotel/controller/recentlycontroller.dart';
import 'package:hotel/repo/homeRepositary.dart';

// import 'package:hotel/controller/search_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put here
    Get.put(HomeRepository());
    Get.put(NavigationController());
    Get.put(HomeController(homeRepository: Get.find()));
    Get.put(RecentlyController());
    // Get.put(FindController());
  }
}
