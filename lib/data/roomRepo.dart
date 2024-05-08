import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/model/booking_model.dart';
import 'package:hotel/model/cancelBooking_model.dart';
import 'package:hotel/model/model_detail.dart';
import 'package:hotel/model/room_model.dart';

import '../model/getCurrentUserBooking.dart';

class RoomRepo {
  Future<List<Datum>> getRoomData() async {
    final resdata = await GetXAPI.instance.get(path: ServerRout.showRoom);
    return RoomModel.fromJson(resdata).data;
  }

  Future<RoomDetailModel> getDetialData(int id) async {
    final res =
        await GetXAPI.instance.get(path: ServerRout.detailPath + id.toString());
    return RoomDetailModel.fromJson(res);
  }

  Future<dynamic> postBookingData(BookingModel bookingModel) async {
    print(bookingModel);
    final res = await GetXAPI.instance
        .post(path: ServerRout.bookingAPI, data: bookingModel.toJson());
    return res;
  }

  Future<GetCurrentUserBookingModel> getCurrentUserBooking() async {
    final res =
        await GetXAPI.instance.get(path: ServerRout.getCurrentUserBooking);
    print("--------> Res Booking Data${res}");
    return GetCurrentUserBookingModel.fromJson(res);
  }

  Future<dynamic> postCancelBooking(String bookindId) async {
    final res = await GetXAPI.instance
        .post(path: ServerRout.cancelBooking + "/${bookindId}/cancel");
    return res;
  }
}
