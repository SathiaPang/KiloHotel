import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/login_response.dart';

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
}
