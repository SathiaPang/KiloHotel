import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/login_response.dart';

import 'resetpassword_respone.dart';

class UserRespoitory {
  Future<dynamic> register(
    String username,
    String name,
    String phone,
    String email,
    String password,
    String address,
  ) async {
    final res = await GetXAPI.instance.post(
      path: ServerRout.register,
      data: {
        "username": username,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "address": address,
        "bio": "Heloo"
      },
    );
    print("Repo----------->>>${res}");
    return res;
  }

  Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    final res = await GetXAPI.instance.post(path: ServerRout.login, data: {
      "username": email,
      "password": password,
    });
    return LoginResponse.fromJson(res);
  }

  Future<ResetResponse> resetPassword(
    String oldPassword,
    String password,
    String confirmPassword,
  ) async {
    final res = await GetXAPI.instance.put(
      path: ServerRout.reset,
      data: {
        "oldPassword": oldPassword,
        "password": password,
        "confirmPassword": confirmPassword
      },
    );
    return ResetResponse.fromJson(res);
  }

  Future<ResetResponse> updateProfile(
    String username,
    String name,
    String phone,
    String email,
    String address,
  ) async {
    final res = await GetXAPI.instance.put(
      path: ServerRout.updateProfile,
      data: {
        "username": username,
        "name": name,
        "phone": phone,
        "email": email,
        "address": email,
        "bio": "jkhlkhkhlkhhlk",
      },
    );
    return ResetResponse.fromJson(res);
  }
}
