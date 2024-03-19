import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectDateController extends GetxController {
  // Select
  Rx<String> _selectedDate = Rx<String>("");
  String get selectedDate => _selectedDate.value;
  // End Selecte
  Rx<String> _nDate = Rx<String>("");
  String get nDate => _nDate.value;
  // Data Count
  Rx<String> _dataCount = Rx<String>("");
  String get dataCount => _dataCount.value;

  Future<void> selectDate(DateTime date) async {
    _selectedDate(DateFormat('dd-MM-yyyy').format(date));
  }

  Future<void> endDate(DateTime date) async {
    _nDate.value = DateFormat('dd-MM-yyyy').format(date);
  }

  int dateCount() {
    if (_selectedDate.value.isEmpty || _nDate.value.isEmpty) {
      return 0;
    }
    DateTime startDate = DateFormat('dd-MM-yyyy').parse(_selectedDate.value);
    DateTime endDate = DateFormat('dd-MM-yyyy').parse(_nDate.value);
    Duration difference = endDate.difference(startDate);
    return difference.inDays;
  }
}
