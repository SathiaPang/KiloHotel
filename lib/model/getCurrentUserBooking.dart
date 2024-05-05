import 'package:intl/intl.dart';

class GetCurrentUserBookingModel {
  int status;
  String message;
  String messageKey;
  List<DataBooking> data;
  Paging paging;

  GetCurrentUserBookingModel({
    required this.status,
    required this.message,
    required this.messageKey,
    required this.data,
    required this.paging,
  });

  factory GetCurrentUserBookingModel.fromJson(Map<String, dynamic> json) =>
      GetCurrentUserBookingModel(
        status: json["status"],
        message: json["message"],
        messageKey: json["messageKey"],
        data: List<DataBooking>.from(
            json["data"].map((x) => DataBooking.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "messageKey": messageKey,
        "paging": paging.toJson(),
      };
}

class BookingDetail {
  RoomType roomType;

  BookingDetail({
    required this.roomType,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        roomType: RoomType.fromJson(json["roomType"]),
      );

  Map<String, dynamic> toJson() => {
        "roomType": roomType.toJson(),
      };
}

class RoomType {
  String title;
  List<Image> image;

  RoomType({
    required this.title,
    required this.image,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        title: json["title"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
      };
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class DataBooking {
  int id;
  String? status;
  String? checkInAt;
  String? checkOutAt;
  String? specialRequest;
  User user;
  List<BookingDetail> bookingDetail;

  DataBooking(
      {required this.id,
      required this.status,
      required this.checkInAt,
      required this.checkOutAt,
      required this.specialRequest,
      required this.user,
      required this.bookingDetail});

  factory DataBooking.fromJson(Map<String, dynamic> json) => DataBooking(
        id: json["id"],
        status: json["status"],
        checkInAt:
            DateFormat('yyyy-MM-dd').format(DateTime.parse(json["checkInAt"])),
        checkOutAt:
            DateFormat('yyyy-MM-dd').format(DateTime.parse(json["checkOutAt"])),
        specialRequest: json["specialRequest"],
        user: User.fromJson(json["user"]),
        bookingDetail: List<BookingDetail>.from(
            json["bookingDetail"].map((x) => BookingDetail.fromJson(x))),
      );
}

class User {
  String name;

  User({
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Paging {
  int page;
  int size;
  int totalPage;
  int totals;

  Paging({
    required this.page,
    required this.size,
    required this.totalPage,
    required this.totals,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        page: json["page"],
        size: json["size"],
        totalPage: json["totalPage"],
        totals: json["totals"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "totalPage": totalPage,
        "totals": totals,
      };
}
