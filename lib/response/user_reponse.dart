import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/login_response.dart';

import 'resetpassword_respone.dart';

class UserRespoitory {
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
      String oldPassword, String password, String comfirmPassword) async {
    final res = await GetXAPI.instance.put(path: ServerRout.reset, data: {
      "oldPassword": oldPassword,
      "password": password,
      "comfirmPassword": comfirmPassword,
    });
    return ResetResponse.fromJson(res);
  }
}
