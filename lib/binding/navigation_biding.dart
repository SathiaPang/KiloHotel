import 'package:get/get.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';
import 'package:hotel/controller/recentlycontroller.dart';
import 'package:hotel/controller/search_controller.dart';
import 'package:hotel/repo/homeRepositary.dart';
import 'package:hotel/repo/searchRepository.dart';

class NavigationBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(HomeRepository());
    Get.put(HomeController(homeRepository: Get.find()));
    Get.put(SearchRepository());
    Get.put(FindController(searchRepository: Get.find()));
    Get.put(RecentlyController());
  }
}
