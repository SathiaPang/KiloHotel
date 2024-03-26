import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/model/getprofile_model.dart';

class UserRepo {
  Future<ProfileModel> getProfileData() async {
    final res = await GetXAPI.instance.get(path: ServerRout.getProfile);
    return ProfileModel.fromJson(res);
  }
}
