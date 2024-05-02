import 'package:get/get.dart';
import 'package:hotel/controller/bookingDetail_controller.dart';
import 'package:intl/intl.dart';

class SelectDateController extends GetxController {
  // Start Select
  Rx<String> _selectedDate = Rx<String>("");
  String get selectedDate => _selectedDate.value;
  // End Selecte
  Rx<String> _nDate = Rx<String>("");
  String get nDate => _nDate.value;
  RxInt personQty = 1.obs;
  //  HomeController
  late BookingDetailController bookingController = Get.find();

  Future<void> selectDate(DateTime date) async {
    _selectedDate(DateFormat('dd-MM-yyyy').format(date));
  }

  Future<void> endDate(DateTime date) async {
    _nDate.value = DateFormat('dd-MM-yyyy').format(date);
  }

  int dateCount() {
    if (_selectedDate.value.isEmpty || _nDate.value.isEmpty) {
      return 1;
    }
    DateTime startDate = DateFormat('dd-MM-yyyy').parse(_selectedDate.value);
    DateTime endDate = DateFormat('dd-MM-yyyy').parse(_nDate.value);
    Duration difference = endDate.difference(startDate);
    return difference.inDays;
  }

  double totalPayment() {
    int day = dateCount();
    double total = day * bookingController.detail.value!.data!.price!;
    return total;
  }

  increasment() {
    personQty++;
  }

  decreasment() {
    if (personQty > 1) {
      personQty--;
    }
  }
}
