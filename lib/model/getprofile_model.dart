class ProfileModel {
  int? status;
  String? message;
  String? messageKey;
  Data? data;
  dynamic paging;

  ProfileModel(
      {this.status, this.message, this.messageKey, this.data, this.paging});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? id;
  String? address;
  bool? status;
  String? email;
  String? phone;
  String? bio;
  String? avatar;
  RoleEntity? roleEntity;
  dynamic createdBy;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.name,
      this.id,
      this.address,
      this.status,
      this.email,
      this.phone,
      this.bio,
      this.avatar,
      this.roleEntity,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    address = json['address'];
    status = json['status'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    avatar = json['avatar'];
    roleEntity = json['roleEntity'] != null
        ? new RoleEntity.fromJson(json['roleEntity'])
        : null;
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['address'] = this.address;
    data['status'] = this.status;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['avatar'] = this.avatar;
    if (this.roleEntity != null) {
      data['roleEntity'] = this.roleEntity!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class RoleEntity {
  String? name;
  int? id;
  String? code;

  RoleEntity({this.name, this.id, this.code});

  RoleEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['code'] = this.code;
    return data;
  }
}
