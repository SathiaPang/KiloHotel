import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/repo/homeRepositary.dart';

class HomeController extends GetxController {
  HomeController({required this.homeRepository});
  final repo = <Hotel>[].obs;
  final roomcategorys = <RoomCategory>[].obs;
  final HomeRepository homeRepository;

  List<Hotel> _allList = [];

  @override
  void onInit() async {
    // Get Category
    final tabcate = homeRepository.getRoomCategory();
    roomcategorys(tabcate);

    // Get list Hotel
    _allList = await homeRepository.getList();
    filTerByIndex(0);
    super.onInit();
  }

  void filTerByIndex(int index) {
    final categoryroom = roomcategorys[index];
    final tmplist =
        _allList.where((e) => e.category == categoryroom.tab).toList();
    repo(tmplist);
  }

  @override
  void onReady() {
    super.onReady();
  }
}
