import 'package:get/get.dart';
import 'package:hotel/view/splashScreen/loading1.dart';
import 'package:hotel/view/splashScreen/loading2.dart';
import 'package:hotel/view/splashScreen/splashScreen1.dart';
import 'package:hotel/view/splashScreen/splashScreen2.dart';
import 'package:hotel/view/splashScreen/splashScreen3.dart';

class AppRoute {
  static String load1 = "/l1";
  static String load2 = "/l2";
  static String splash1 = "/spl1";
  static String splash2 = "/spl2";
  static String splash3 = "/spl3";

  static List<GetPage> appPage = [
    //
    GetPage(name: load1, page: () => const Loading1()),
    GetPage(name: load2, page: () => const Loading2()),
    GetPage(name: splash1, page: () => SplashScreen1()),
    GetPage(name: splash2, page: () => SplashScreen2()),
    GetPage(name: splash3, page: () => SplashScreen3())
    //
  ];
}
