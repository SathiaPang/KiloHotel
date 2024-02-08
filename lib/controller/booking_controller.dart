
import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/repo/homeRepositary.dart';

class BookingController extends GetxController {
  final repo = HomeRepository();
  var selectedIndex = 0.obs;

// import 'package:get/get.dart';
// import 'package:hotel/data/data.dart';
// import 'package:hotel/repo/homerepo.dart';

// class BookingController extends GetxController {
//   final repo = HomeRepo();
//   var selectedIndex = 0.obs;


//   List<Hotel> allList = [];
//   final listHotel = <Hotel>[].obs;
//   final activateTab = 0.obs;

//   void setTabActivate(int tab) {
//     activateTab(tab);
//     filterByTab(tab == 0 ? "Ongoing" : "Other Tab");
//   }

//   void filterByTab(String tab) {
//     final filterList = allList.where((hotel) => hotel.tab == tab).toList();
//   }


  // void onReady() {
  //   allList = repo.getList();
  //   filterByTab("Ongoing");
  //   super.onReady();
  // }
}

//   @override
//   void onReady() {
//     allList = repo.getRoomList();
//     filterByTab("Ongoing");
//     super.onReady();
//   }
// }
