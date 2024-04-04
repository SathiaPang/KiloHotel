import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));
String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  int status;
  String message;
  String messageKey;
  List<Datum> data;
  Paging paging;

  RoomModel({
    required this.status,
    required this.message,
    required this.messageKey,
    required this.data,
    required this.paging,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        status: json["status"],
        message: json["message"],
        messageKey: json["messageKey"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "messageKey": messageKey,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
      };
}

class ImageClass {
  int? id;
  String? url;
  ImageClass({required this.id, required this.url});

  factory ImageClass.fromJson(Map<String, dynamic> json) =>
      ImageClass(id: json["id"] as int, url: json["url"] as String);

  Map<String, dynamic> toJson() => {"id": id, "url": url};
}

class Datum {
  int? id;
  int? children;
  String? title;
  String? description;
  String? subTitle;
  int? adult;
  int? bed;
  String? amenity;
  double price;
  CreatedBy? createdBy;
  UpdateBy? updatedBy;
  String createdAt;
  dynamic updatedAt;
  List<ImageClass> image;

  Datum({
    required this.id,
    required this.children,
    required this.title,
    required this.description,
    required this.subTitle,
    required this.adult,
    required this.bed,
    required this.amenity,
    required this.price,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        children: json["children"],
        title: json["title"],
        description: json["description"],
        subTitle: json["subTitle"],
        adult: json["adult"],
        bed: json["bed"],
        amenity: json["amenity"],
        price: json["price"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        updatedBy: UpdateBy.fromJson(json["updatedBy"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        image: (json["image"] as List<dynamic>?)
                ?.map((imageJson) => ImageClass.fromJson(imageJson))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "children": children,
        "title": title,
        "description": description,
        "subTitle": subTitle,
        "adult": adult,
        "bed": bed,
        "amenity": amenity,
        "price": price,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "image": List<ImageClass>.from(image.map((x) => x)),
      };
}

class CreatedBy {
  String name;
  int id;

  CreatedBy({
    required this.name,
    required this.id,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class UpdateBy {
  String? name;
  int id;

  UpdateBy({
    required this.name,
    required this.id,
  });

  factory UpdateBy.fromJson(Map<String, dynamic> json) => UpdateBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

enum Name { HUN_LIHONG, LIHONG_TESTER, NARUTO, SUPER_ADMIN }

final nameValues = EnumValues({
  "Hun Lihong": Name.HUN_LIHONG,
  "Lihong(Tester)": Name.LIHONG_TESTER,
  "naruto": Name.NARUTO,
  "Super Admin": Name.SUPER_ADMIN
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
