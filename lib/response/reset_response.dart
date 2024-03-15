import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/response/resetpassword_respone.dart';

class ResetRepository {
  Future<ResetResponse> resetpassword(
      String oldPassword, String password, String confirmPassword) async {
    try {
      final res = await GetXAPI.instance.put(path: ServerRout.reset, data: {
        "oldPassword": oldPassword,
        "password": password,
        "confirmPassword": confirmPassword,
      });

      return ResetResponse.fromJson(res);
    } catch (error) {
      print('Error during password reset: $error');
      // Handle the error, e.g., show a snackbar or log the details
      throw error; // Rethrow the error if needed
    }
  }
}
