class RoomDetailModel {
  int? status;
  String? message;
  String? messageKey;
  Data? data;
  dynamic paging;

  RoomDetailModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  RoomDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageKey = json['messageKey'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    paging = json['paging'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageKey'] = this.messageKey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paging'] = this.paging;
    return data;
  }
}

class Data {
  int? id;
  int? children;
  String? title;
  int? adult;
  String? description;
  dynamic subTitle;
  double? price;
  int? bed;
  String? amenity;
  CreatedBy? createdBy;
  CreatedBy? updatedBy;
  String? createdAt;
  String? updatedAt;
  List<Images>? image;

  Data(
      {this.id,
      this.children,
      this.title,
      this.adult,
      this.description,
      this.subTitle,
      this.price,
      this.bed,
      this.amenity,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    children = json['children'];
    title = json['title'];
    adult = json['adult'];
    description = json['description'];
    subTitle = json['subTitle'];
    price = json['price'];
    bed = json['bed'];
    amenity = json['amenity'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    updatedBy = json['updatedBy'] != null
        ? new CreatedBy.fromJson(json['updatedBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['image'] != null) {
      image = <Images>[];
      json['image'].forEach((v) {
        image!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['children'] = this.children;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['description'] = this.description;
    data['subTitle'] = this.subTitle;
    data['price'] = this.price;
    data['bed'] = this.bed;
    data['amenity'] = this.amenity;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreatedBy {
  String? name;
  int? id;

  CreatedBy({this.name, this.id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Images {
  int? id;
  String? url;
  Images({required this.id, required this.url});

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(id: json["id"] as int, url: json["url"] as String);

  Map<String, dynamic> toJson() => {"id": id, "url": url};
}
