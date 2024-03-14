import 'package:get/get.dart';
import 'package:hotel/binding/login_binding.dart';
import 'package:hotel/binding/navigation_biding.dart';
import 'package:hotel/binding/register_binding.dart';
import 'package:hotel/view/auth/signIn/login.dart';
import 'package:hotel/view/auth/signIn/signInScreen.dart';
import 'package:hotel/view/auth/signUp/signUpScreen.dart';
import 'package:hotel/view/navigationbar/naviga.dart';
import 'package:hotel/view/splashScreen/loading1.dart';
import 'package:hotel/view/splashScreen/loading2.dart';
import 'package:hotel/view/splashScreen/splashScreen1.dart';
import 'package:hotel/view/splashScreen/splashScreen2.dart';
import 'package:hotel/view/splashScreen/splashScreen3.dart';

class AppRoute {
  static String load1 = "/l1";
  static String splash1 = "/spl1";
  static String splash2 = "/spl2";
  static String splash3 = "/spl3";
  static String load2 = "/l2";
  static String signin = "/signin";
  static String login = "/login";
  static String bottomNavigation = "/navigation";
  static String register = "/register";

  static List<GetPage> appPage = [
    //
    GetPage(name: load1, page: () => Loading1()),
    GetPage(name: splash1, page: () => SplashScreen1()),
    GetPage(name: splash2, page: () => SplashScreen2()),
    GetPage(name: splash3, page: () => SplashScreen3()),
    GetPage(name: load2, page: () => Loading2()),
    GetPage(name: signin, page: () => SigninScreen()),
    GetPage(
      name: register, page: () => SignupScreen(),
      //  binding: RegisterBinding()
    ),
    GetPage(name: login, page: () => Login(), binding: LoginBiding()),
    GetPage(
        name: bottomNavigation,
        page: () => MyNavigationBar(),
        binding: NavigationBiding())
    //
  ];
}
