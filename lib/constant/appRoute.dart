import 'package:get/get.dart';
import 'package:hotel/constant/binding/bookingdeatil_binding.dart';
import 'package:hotel/constant/binding/login_binding.dart';
import 'package:hotel/constant/binding/nameReservationBindding.dart';
import 'package:hotel/constant/binding/navigation_biding.dart';
import 'package:hotel/constant/binding/notification_binding.dart';
import 'package:hotel/constant/binding/register_binding.dart';
import 'package:hotel/constant/binding/reset_binding.dart';
import 'package:hotel/constant/binding/security_binding.dart';
import 'package:hotel/constant/binding/selectDateBinding.dart';
import 'package:hotel/constant/binding/update_binding.dart';
import 'package:hotel/payment/cancelHotel.dart';
import 'package:hotel/payment/nameOfReserver.dart';
import 'package:hotel/view/Onborading/onboarding_view.dart';
import 'package:hotel/view/Profile/setting.dart';
import 'package:hotel/view/Profile/editprofile.dart';
import 'package:hotel/view/Profile/notificationScreen.dart';
import 'package:hotel/view/Profile/ChangePassword.dart';
import 'package:hotel/view/Profile/security.dart';
import 'package:hotel/view/auth/signIn/login.dart';
import 'package:hotel/view/auth/signIn/signInScreen.dart';
import 'package:hotel/view/auth/signUp/signUpScreen.dart';
import 'package:hotel/view/booking/booking_screen.dart';
import 'package:hotel/view/booking/recently.dart';
import 'package:hotel/view/dialogPayment/dialogPayment.dart';
import 'package:hotel/view/home/home_screen.dart';
import 'package:hotel/view/navigationbar/naviga.dart';
import 'package:hotel/view/selectdate/selectdate.dart';
import 'package:hotel/view/splashScreen/loading1.dart';
import 'package:hotel/view/splashScreen/loading2.dart';

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
  static String nameReseve = "/nameReseve";
  static String security = "/security";
  static String editPF = "/editPF";
  static String bookindeDetail = "/bookingDetail";
  static String payment1 = "/payment1";
  static String cancelHotel = "/cancelHotel";
  static String dialogPay = "/dialogPay";
  static String recenly = "/recenly";
  static String homescreen = "/homescreen";
  static String bookingScreen = "/bookingScreen";
  static String setting = "/setting";
  static String notification = "/notification";
  static String splashScreen = "/splashScreen";

  static List<GetPage> appPage = [
    //
    GetPage(name: load1, page: () => Loading1()),
    GetPage(name: load2, page: () => Loading2(), binding: LoginBiding()),
    GetPage(name: splashScreen, page: () => OnboardingScreen()),
    GetPage(name: signin, page: () => SigninScreen()),
    GetPage(name: homescreen, page: () => HomeScreen()),
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
      page: () => SelectDate(),
      binding: SelectDateBnding(),
    ),

    GetPage(
        name: nameReseve,
        page: () => NameOfReserver(),
        binding: NameReservationBindding()),
    GetPage(name: cancelHotel, page: () => CancelHotel()),
    GetPage(name: dialogPay, page: () => DialogPayMent()),
    GetPage(name: recenly, page: () => RecentlyScreen()),

    GetPage(
        name: security,
        page: () => SecurityScreen(),
        binding: SecurityBinding()),
    GetPage(name: editPF, page: () => EditPF(), binding: UpdateBinding()),
    GetPage(
        name: bookindeDetail,
        page: (() => BookDetailScreenOne()),
        binding: BookDetailBinding()),
    GetPage(
        name: bookingScreen,
        page: () => BookingScreen(),
        binding: BookDetailBinding()),
    GetPage(name: setting, page: () => Setting()),
    GetPage(
        name: notification,
        page: () => NotiScreen(),
        binding: NotificationBinding()),
  ];
}
