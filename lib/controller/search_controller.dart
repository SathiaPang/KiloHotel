import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/repo/homeRepositary.dart';

class FindController extends GetxController {
  final repo = HomeRepository();
  var selectedIndex = 0.obs;

  List<Hotel> allList = [];
  final List<Hotel> listHotel = <Hotel>[].obs;
  final activateTab = 0.obs;

  void setTabActivate(int tab) {
    activateTab(tab);
    filterByTab(tab == 0 ? "All Hotel" : "Other Tab");
  }

  void filterByTab(String tab) {
    final filterList = allList.where((hotel) => hotel.tab == tab).toList();
  }

  @override
  void onReady() {
    // allList = repo.getList();
    // filterByTab("All Hotel");
    // super.onReady();
  }
}
