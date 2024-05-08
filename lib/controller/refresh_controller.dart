import 'package:get/get.dart';

class RefreshController extends GetxController {
  Future<void> refresh() async {
    return await Future.delayed(Duration(seconds: 1));
  }
}
