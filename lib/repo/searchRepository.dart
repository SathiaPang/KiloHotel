import 'package:hotel/data/data.dart';

class SearchRepository {
  Future<List<Hotel>> getSearchList() {
    return Future.value(Hotel.hotel);
  }

  List<RoomCategory> getSearchCategory() => SearchCategory.getSearchList();
}
