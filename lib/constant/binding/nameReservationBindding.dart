import 'package:get/get.dart';
import 'package:hotel/controller/name_of_reservation_controller.dart';
import 'package:hotel/controller/selectDateController.dart';
import 'package:hotel/data/roomRepo.dart';

class NameReservationBindding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomRepo());
    Get.put(NameOfReservationController(repo: Get.find()));
    Get.put(SelectDateController());
  }
}
