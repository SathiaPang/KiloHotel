import 'package:get/get.dart';
import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/model/room_model.dart';

class FindController extends GetxController {
  var data = [];
  final selectedIndex = 0.obs;
  final click = true.obs;
  List<Datum> dataRoom = [];
  final RxBool isGridVisible = false.obs;

  Future<List<Datum>> getRoomData({String? query}) async {
    final res = await GetXAPI.instance.get(path: ServerRout.showRoom);
    List<Datum> fetchedDataRoom = RoomModel.fromJson(res).data;

    if (query != null) {
      fetchedDataRoom = fetchedDataRoom
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    dataRoom = fetchedDataRoom;

    return dataRoom;
  }
}
