import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectDateController extends GetxController {
  Rx<String> _selectedDate = Rx<String>("");

  String get selectedDate => _selectedDate.value;

  Future<void> selectDate(DateTime date) async {
    // _selectedDate(date);
    // DateFormat('yyyy-MM-ddd').format(date);
    _selectedDate(DateFormat('yyyy-MM-dd').format(date));
  }

  // String formatDate() => DateFormat('yyyy-MM-ddd').format(selectedDate!);
// print(formattedDate);
}
