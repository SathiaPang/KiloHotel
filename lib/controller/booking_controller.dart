import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/model/getCurrentUserBooking.dart';

class BookingController extends GetxController {
  RoomRepo roomrepo;
  BookingController({required this.roomrepo});
  final lstBookingStatus = [].obs;

  var lstBookingItems = <DataBooking>[];
  final lstBookingShowUI = <DataBooking>[].obs;
  List<String?> maptab = [
    "CONFIRMED",
    "CANCELLED",
    "CHECKED IN",
  ];

  get filterByTab => null;

  @override
  void onInit() {
    getBookingData();
    super.onInit();
  }

  getBookingData() async {
    try {
      final bookingData = await roomrepo.getCurrentUserBooking();
      if (bookingData.status == 200) {
        lstBookingItems = bookingData.data;
        filterbyTab(0);
      }
    } on DioException catch (e) {
      Get.snackbar("", "${e.message}");
    }
  }

  void filterbyTab(int index) {
    print(index);
    final status = maptab[index];
    print(status);
    final list = lstBookingItems.where((element) => element.status == status);
    lstBookingShowUI.value = list.toList();
  }

  void cancelBookink(String bookindId) async {
    try {
      final res = roomrepo.postCancelBooking(bookindId);
      print("=====> cancel res ${res}");
      getBookingData();
    } on DioException catch (e) {
      print(e.response?.data ?? "");
    }
  }
}
