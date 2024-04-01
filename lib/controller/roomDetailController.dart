import 'package:get/get.dart';
import 'package:hotel/controller/home_controller.dart';

class RoomViewDetailController extends GetxController {
  final HomeController _homeController = Get.find();

  getDetailData(int index) async {
    final detail = _homeController.listDatum[index];
  }
}
