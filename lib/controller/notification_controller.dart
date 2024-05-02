import 'package:get/get.dart';

class NotificationController extends GetxController {
  var generalNotification = false.obs;
  var sound = false.obs;
  var vibrate = false.obs;
  var appUpdate = false.obs;
  var newServiceAvailable = false.obs;
  var newTipAvailable = false.obs;
}
