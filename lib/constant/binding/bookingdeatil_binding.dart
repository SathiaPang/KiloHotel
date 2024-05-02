import 'package:get/get.dart';
import 'package:hotel/controller/bookingDetail_controller.dart';
import 'package:hotel/controller/booking_controller.dart';
import 'package:hotel/data/roomRepo.dart';

class BookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomRepo());
    Get.put(BookingDetailController(roomRepo: Get.find()));
    Get.put(BookingController(roomrepo: Get.find()));
  }
}
