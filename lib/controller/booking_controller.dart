import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/model/model_detail.dart';
import 'package:hotel/model/room_model.dart';
import 'package:hotel/repo/bookingRepositary.dart';

class BookingController extends GetxController {
  RoomRepo roomRepo;
  BookingController({required this.roomRepo});
  final hotelBooking = <Hotel>[].obs;
  final selectedIndex = 0.obs;
  final bookingRepo = BookingRepositary.instance;
  Rx<RoomDetailModel?> detail = Rx<RoomDetailModel?>(null);

  void saveBooking(Hotel hotel, storeKey) async {
    print(hotel.name);
    final isSave = await bookingRepo.saveBooking(hotel, "Booking");
    if (isSave) {
      update();
      print("_____________Put Success________________");
    }
  }

  void getDatahotel() async {
    final imageDetail = await bookingRepo.getHotel("Booking");
    hotelBooking.value = imageDetail;
    update();
    print("------------Get-Cart------------");
  }

  getDetailData(int id) async {
    try {
      final res = await roomRepo.getDetialData(id);
      detail(res);
    } on DioException catch (e) {
      print(e.response!.statusMessage!);
    }
  }
}
