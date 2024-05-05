import 'package:hotel/api/getxAPI.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/model/getprofile_model.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:http_parser/http_parser.dart';

class UserRepo {
  Future<ProfileModel> getProfileData() async {
    final res = await GetXAPI.instance.get(path: ServerRout.getProfile);
    return ProfileModel.fromJson(res);
  }

  uploadProfileImage(File image) async {
    final multipParth = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last,
        contentType: MediaType("image", "jpeg"));

    var formData = FormData.fromMap({
      'image': multipParth,
      "type": "image/*",
    });
    try {
      final response = await GetXAPI.instance.post(
        path: ServerRout.uploadProfile,
        data: formData,
        contentType: 'multipart/form-data;',
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
