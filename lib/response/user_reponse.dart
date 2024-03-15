import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/login_response.dart';
import 'package:hotel/response/resetpassword_respone.dart';

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
      String oldPassword, String newPassword, String comfirmPassword) async {
    final reset = await GetXAPI.instance.post(path: ServerRout.reset, data: {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "comfirmPassword": comfirmPassword,
    });
    return ResetResponse.fromJson(reset);
  }
}
