import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

class SignUpResponse {
  int status;
  String message;
  String messageKey;
  RegisterData? registerData;
  dynamic paging;

  //The RegisterData is a class, other is datatype

  SignUpResponse({
    required this.status,
    required this.message,
    required this.messageKey,
    required this.registerData,
    required this.paging,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        message: json["message"],
        messageKey: json["messageeKey"],
        registerData: RegisterData.fromJson(json["data"]),
        paging: json["paging"],
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "messageKey": messageKey,
        "data": registerData?.toJson(),
        "paging": paging,
      };
}

class RegisterData {
  RegisterUser user;
  String token;

  RegisterData({required this.user, required this.token});
  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
      user: RegisterUser.fromJson(json["user"]), token: json["token"]);

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class RegisterUser {
  String username;
  String name;
  dynamic phone;
  dynamic email;
  dynamic password;
  dynamic address;
  bool status;
  dynamic bio;

  RegisterUser(
      {required this.username,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.address,
      required this.status,
      required this.bio});
  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
      username: json["usename"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      password: json["password"],
      address: json["address"],
      status: json["status"],
      bio: json["bio"]);
  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "address": address,
        "status": status,
        "bio": bio,
      };
}
