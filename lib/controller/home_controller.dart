import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/model/room_model.dart';

class HomeController extends GetxController {
  RoomRepo roomrepo;
  HomeController({required this.roomrepo});
  Rx<RoomModel?> roomModel = Rx<RoomModel?>(null);
  RxList<Datum> listDatum = RxList.empty(growable: true);

  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      final resdata = await roomrepo.getRoomData();
      listDatum(resdata);
    } on DioException catch (e) {
      print(e);
    }
    ;
  }
}
