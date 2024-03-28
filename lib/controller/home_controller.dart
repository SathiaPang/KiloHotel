import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/data/data.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/repo/homeRepositary.dart';

import '../model/RoomModel.dart';

class HomeController extends GetxController {
  RoomRepo roomrepo;
  HomeController({required this.homeRepository, required this.roomrepo});
  final repo = <Hotel>[].obs;
  final roomcategorys = <RoomCategory>[].obs;
  final HomeRepository homeRepository;
  final selectedIndex = 0.obs;
  Rx<RoomModel?> roomModel = Rx<RoomModel?>(null);
  List<Hotel> _allList = [];
  RxList<Datum> listDatum = RxList.empty(growable: true);

  @override
  void onInit() async {
    // Get Category
    final tabcate = homeRepository.getRoomCategory();
    roomcategorys(tabcate);

    // Get list Hotel
    _allList = await homeRepository.getList();
    filTerByIndex(0);
    getData();
    super.onInit();
  }

  void filTerByIndex(int index) {
    selectedIndex(index);
    final categoryroom = roomcategorys[index];
    final tmplist =
        _allList.where((e) => e.category == categoryroom.tab).toList();
    repo(tmplist);
    print(selectedIndex);
    update();
  }

  getData() async {
    try {
      final resdata = await roomrepo.getRoomData();
      // listDatum.value = resdata;
      listDatum(resdata);
    } on DioException catch (e) {
      print(e);
    }
    ;
  }
}
