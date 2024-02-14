import 'package:get/get.dart';

class RecentlyController extends GetxController {
  final RxBool isGridVisible = false.obs;

  void toggleView() {
    isGridVisible.value = false;
    update();
  }

  void showGridView() {
    isGridVisible.value = true;
    update();
  }
}
