import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/register/signup_response.dart';

class UserRegisterRepository {
  Future<SignUpResponse> register(
    String username,
    String name,
    String email,
    String password,
    String phone,
    String address,
  ) async {
    final res = await GetXAPI.instance.post(path: ServerRout.register, data: {
      "username": username,
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
    });
    return SignUpResponse.fromJson(res);
  }
}
