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

class User {
  String username;
  String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(username: json["username"], password: json["password"]);
  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
