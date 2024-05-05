// import 'dart:convert';

// import 'package:hotel/data/data.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class BookingRepositary {
//   static BookingRepositary get instance => BookingRepositary._instance();
//   BookingRepositary._instance();

//   Future<SharedPreferences> _getSharedPreferences() async =>
//       await SharedPreferences.getInstance();

//   Future<bool> saveBooking(Hotel hotel, String storeKey) async {
//     final hotelDetail = await getHotel(storeKey);
//     final isExist =
//         hotelDetail.indexWhere((element) => element.name == hotel.name);

//     if (isExist == -1) {
//       hotelDetail.add(hotel);
//       print("Success");
//       await _saveHotel(hotelDetail, storeKey);
//       return true;
//     } else {
//       print("fail");
//       return false;
//     }
//   }

//   Future<void> _saveHotel(List<Hotel> hotels, String storeKey) async {
//     final pref = await _getSharedPreferences();
//     final hotelStrings =
//         hotels.map((hotel) => jsonEncode(hotel.toMap())).toList();
//     await pref.setStringList(storeKey, hotelStrings);
//   }

//   Future<List<Hotel>> getHotel(String storeKey) async {
//     final pref = await _getSharedPreferences();
//     final items = pref.getStringList(storeKey);
//     return items?.map((e) => Hotel.fromMap(jsonDecode(e))).toList() ?? [];
//   }
// }
