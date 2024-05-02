import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/controller/selectDateController.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/model/booking_model.dart';
import 'package:hotel/model/room_model.dart';

class NameOfReservationController extends GetxController {
  RoomRepo repo;
  NameOfReservationController({required this.repo});
  final fullName = TextEditingController(text: "sss");
  final nickName = TextEditingController(text: "sss");
  final dateOfBirth = TextEditingController(text: "2024-04-26");
  final email = TextEditingController(text: "sss@gmail.com");
  final phoneNumber = TextEditingController(text: "123456789");
  final SelectDateController _selectDateController = Get.find();
  final Datum datum = Get.arguments;

  void saveNameReservation(Datum datum) async {
    final list = covert(datum);
    print("=========== aldut ${list.adult}");
    print("===========  child ${list.child}");
    print("===========  room id ${list.roomTypeId}");

    BookingModel bookingModel = BookingModel(
        // checkIn: _selectDateController.selectedDate,
        // checkOut: _selectDateController.nDate,
        checkIn: "2024-04-27",
        checkOut: "2024-04-29",
        specialRequest: "special request!!!!",
        bookingDetail: [list]);
    update();
    Get.toNamed(AppRoute.dialogPay);
    try {
      final res = await repo.postBookingData(bookingModel);
      print("====> Save Booking --- ${res}");
    } on DioException catch (e) {
      print(e.message.toString());
    }
  }

  clearField() {
    fullName.clear();
    nickName.clear();
    dateOfBirth.clear();
    email.clear();
    phoneNumber.clear();
  }

  BookingDetail covert(Datum datum) {
    return BookingDetail(
        adult: datum.adult!, roomTypeId: datum.id!, child: datum.children!);
  }
}
