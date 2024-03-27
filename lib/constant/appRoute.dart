import 'package:get/get.dart';
import 'package:hotel/constant/binding/login_binding.dart';
import 'package:hotel/constant/binding/navigation_biding.dart';
import 'package:hotel/constant/binding/register_binding.dart';
import 'package:hotel/constant/binding/reset_binding.dart';
import 'package:hotel/constant/binding/selectDateBinding.dart';
import 'package:hotel/constant/binding/update_binding.dart';
import 'package:hotel/view/Profile/editprofile.dart';
import 'package:hotel/view/Profile/resetPassword.dart';
import 'package:hotel/view/Profile/security.dart';
import 'package:hotel/view/auth/signIn/login.dart';
import 'package:hotel/view/auth/signIn/signInScreen.dart';
import 'package:hotel/view/auth/signUp/signUpScreen.dart';
import 'package:hotel/view/navigationbar/naviga.dart';

import 'package:hotel/view/splashScreen/loading1.dart';
import 'package:hotel/view/splashScreen/loading2.dart';
import 'package:hotel/view/splashScreen/splashScreen1.dart';
import 'package:hotel/view/splashScreen/splashScreen2.dart';
import 'package:hotel/view/splashScreen/splashScreen3.dart';

import '../booking/booking_detail_1.dart';

class AppRoute {
  static String load1 = "/l1";
  static String splash1 = "/spl1";
  static String splash2 = "/spl2";
  static String splash3 = "/spl3";
  static String load2 = "/l2";
  static String signin = "/signin";
  static String login = "/login";
  static String bottomNavigation = "/navigation";
  static String changePassword = "/changePassword";
  static String register = "/register";
  static String selectDate = "/selectDate";
  static String security = "/security";
  static String editPF = "/editPF";

  // static String selectDate = "/selectDate";
  static List<GetPage> appPage = [
    //
    GetPage(name: load1, page: () => Loading1()),
    GetPage(name: splash1, page: () => SplashScreen1()),
    GetPage(name: splash2, page: () => SplashScreen2()),
    GetPage(name: splash3, page: () => SplashScreen3()),
    GetPage(name: load2, page: () => Loading2(), binding: LoginBiding()),
    GetPage(name: signin, page: () => SigninScreen()),

    GetPage(name: login, page: () => Login(), binding: LoginBiding()),
    GetPage(
        name: register, page: () => SignupScreen(), binding: RegisterBinding()),
    GetPage(
        name: bottomNavigation,
        page: () => MyNavigationBar(),
        binding: NavigationBiding()),
    GetPage(
        name: changePassword,
        page: () => ChangePassword(),
        binding: ResetBinding()),

    GetPage(
        name: selectDate,
        page: () => BookDetailScreenOne(),
        binding: SelectDateBnding()),

    GetPage(
      name: security,
      page: () => SecurityScreen(),
    ),
    GetPage(name: editPF, page: () => EditPF(), binding: UpdateBinding())
  ];
}
