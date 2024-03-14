import 'package:get/get.dart';
import 'package:hotel/controller/selectDateController.dart';

class SelectDateBnding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectDateController());
  }
}
