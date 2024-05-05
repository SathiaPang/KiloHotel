import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel/data/roomRepo.dart';
import 'package:hotel/model/model_detail.dart';

class BookingDetailController extends GetxController {
  RoomRepo roomRepo;
  BookingDetailController({required this.roomRepo});
  Rx<RoomDetailModel?> detail = Rx<RoomDetailModel?>(null);

  getDetailData(int id) async {
    try {
      final res = await roomRepo.getDetialData(id);
      detail(res);
    } on DioException catch (e) {
      print(e.response!.statusMessage!);
    }
  }
}
