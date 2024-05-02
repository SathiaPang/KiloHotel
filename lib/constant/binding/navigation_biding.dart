import 'package:get/get.dart';
import 'package:hotel/controller/booking_controller.dart';
import 'package:hotel/controller/homeScreenController.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/controller/navigatiopn_Controller.dart';
import 'package:hotel/controller/recentlycontroller.dart';
import 'package:hotel/controller/search_controller.dart';
import 'package:hotel/controller/selectDateController.dart';
import 'package:hotel/data/roomRepo.dart';

import 'package:hotel/repo/homeRepositary.dart';
import 'package:hotel/repo/searchRepository.dart';
import 'package:hotel/response/user_repo.dart';

class NavigationBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepo());
    Get.put(RoomRepo());
    Get.put(NavigationController());
    Get.put(HomeRepository());
    Get.put(HomeController(roomrepo: Get.find()));
    Get.put(SearchRepository());
    Get.put(SearchDataController());
    Get.put(RecentlyController());
    Get.put(SelectDateController());
    Get.put(ProfileScreenController(userRepo: Get.find()));
    Get.put(BookingController(roomrepo: Get.find()));
  }
}
