import 'package:get/get.dart';

class RecentlyController extends GetxController {
  final RxBool isGridVisible = false.obs;
  final click = true.obs;

  void toggleView() {
    isGridVisible.value = false;
    update();
    toggleButton();
  }

  void showGridView() {
    isGridVisible.value = true;
    update();
    toggleButton();
  }

  void toggleButton() {
    click(!click.value);
  }
}
