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

class Datum {
  int id;
  int children;
  String title;
  int adult;
  String description;
  String? subTitle;
  double price;
  int bed;
  String amenity;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime createdAt;
  DateTime? updatedAt;
  List<dynamic> image;

  Datum({
    required this.id,
    required this.children,
    required this.title,
    required this.adult,
    required this.description,
    required this.subTitle,
    required this.price,
    required this.bed,
    required this.amenity,
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
        adult: json["adult"],
        description: json["description"],
        subTitle: json["subTitle"],
        price: json["price"],
        bed: json["bed"],
        amenity: json["amenity"],
        createdBy: json["createdBy"] == null
            ? null
            : AtedBy.fromJson(json["createdBy"]),
        updatedBy: json["updatedBy"] == null
            ? null
            : AtedBy.fromJson(json["updatedBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        image: List<dynamic>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "children": children,
        "title": title,
        "adult": adult,
        "description": description,
        "subTitle": subTitle,
        "price": price,
        "bed": bed,
        "amenity": amenity,
        "createdBy": createdBy?.toJson(),
        "updatedBy": updatedBy?.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "image": List<dynamic>.from(image.map((x) => x)),
      };
}

class AtedBy {
  String name;
  int id;

  AtedBy({
    required this.name,
    required this.id,
  });

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
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
