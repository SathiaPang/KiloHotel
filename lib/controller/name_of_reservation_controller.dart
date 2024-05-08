import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
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

  void saveBooking(Datum datum) async {
    final list = covert(datum);
    print("=========== aldut ${_selectDateController.personQtyAdult}");
    print("===========  child ${_selectDateController.personQtyChild}");
    print("===========  room id ${list.roomTypeId}");

    BookingModel bookingModel = BookingModel(
        checkIn: _selectDateController.selectedDate,
        checkOut: _selectDateController.nDate,
        specialRequest: "special request!!!!",
        bookingDetail: [list]);
    print("=======> Booking ===-> ${bookingModel.toJson()}");
    update();

    try {
      final res = await repo.postBookingData(bookingModel);
      Get.toNamed(AppRoute.dialogPay);
      print("=== Datum ===${datum}");
      print("====> Save Booking --- ${res}");
    } on DioException catch (e) {
      print(e.response?.data);
      Get.snackbar("", "",
          duration: Duration(seconds: 2),
          backgroundColor: green,
          titleText: Text(
            "Bolu",
            style: TextStyle(color: white, fontSize: 20),
          ),
          messageText: Text(
            "Room is not available!",
            style: TextStyle(color: white, fontSize: 15),
          ));
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
        adult: datum.adult, roomTypeId: datum.id, child: datum.children);
  }
}
