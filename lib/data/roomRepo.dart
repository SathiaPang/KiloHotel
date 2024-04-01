import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/model/room_model.dart';

class RoomRepo {
  Future<List<Datum>> getRoomData() async {
    final resdata = await GetXAPI.instance.get(path: ServerRout.showRoom);
    return RoomModel.fromJson(resdata).data;
  }
}
