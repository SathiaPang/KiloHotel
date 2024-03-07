import '../data/data.dart';

class HomeRepository {
  Future<List<Hotel>> getList() {
    return Future.value(Hotel.hotel);
  }

  // Future<List<Hotel>> getSearchList() {
  //   return Future.value(Hotel.hotel);
  // }

  List<RoomCategory> getRoomCategory() => RoomCategory.getList();
  // List<RoomCategory> getSearchCategory() => SearchCategory.getSearchList();
}
