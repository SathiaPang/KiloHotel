import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  int status;
  String message;
  String messageKey;
  Data? data;
  dynamic paging;

  LoginResponse(
      {required this.status,
      required this.message,
      required this.messageKey,
      required this.data,
      required this.paging});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        messageKey: json["messageKey"],
        data: Data.fromJson(json["data"]),
        paging: json["paging"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "messageKey": messageKey,
        "data": data?.toJson(),
        "paging": paging,
      };
}

class Data {
  User user;
  String token;

  Data({required this.user, required this.token});
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}


List<User> userModelsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userModelsToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String username;
  String email;
  dynamic avatar;
  dynamic phone;
  dynamic bio;
  dynamic address;
  String roleName;
  int roleId;
  bool status;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.avatar,
      required this.phone,
      required this.bio,
      required this.address,
      required this.roleName,
      required this.roleId,
      required this.status});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      avatar: json["avatar"],
      phone: json["phone"],
      bio: json["bio"],
      address: json["address"],
      roleName: json["roleName"],
      roleId: json["roleId"],
      status: json["status"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "avatar": avatar,
        "phone": phone,
        "bio": bio,
        "address": address,
        "roleName": roleName,
        "roleId": roleId,
        "status": status,
      };
}
