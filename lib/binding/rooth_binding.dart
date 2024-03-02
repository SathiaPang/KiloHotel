import 'package:get/get.dart';
import 'package:hotel/response/user_reponse.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRespoitory());
  }
}
