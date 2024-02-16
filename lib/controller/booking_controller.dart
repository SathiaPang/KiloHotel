import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/repo/bookingRepositary.dart';

class BookingController extends GetxController {
  BookingController({required});
  final hotelBooking = <Hotel>[].obs;
  final selectedIndex = 0.obs;
  final bookingRepo = BookingRepositary.instance;

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
}
