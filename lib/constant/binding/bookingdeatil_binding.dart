import 'package:get/get.dart';
import 'package:hotel/controller/booking_controller.dart';
import 'package:hotel/controller/login_controller.dart';
import 'package:hotel/data/roomRepo.dart';

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomRepo());
    Get.put(BookingController(roomRepo: Get.find()));
  }
}
