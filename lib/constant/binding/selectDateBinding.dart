import 'package:get/get.dart';
import 'package:hotel/controller/bookingDetail_controller.dart';
import 'package:hotel/controller/name_of_reservation_controller.dart';
import 'package:hotel/controller/selectDateController.dart';
import 'package:hotel/data/roomRepo.dart';

class SelectDateBnding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectDateController());
    Get.put(RoomRepo());
    Get.put(BookingDetailController(roomRepo: Get.find()));
    Get.put(NameOfReservationController(repo: Get.find()));
  }
}
