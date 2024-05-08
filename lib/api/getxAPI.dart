import 'package:dio/dio.dart';
import 'package:hotel/constant/server_rout.dart';
import 'package:hotel/local/local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetXAPI {
  late Dio _dio;
  static final basicToken = ServerRout.basicToken;
  GetXAPI._() {
    _dio = Dio(BaseOptions(
        baseUrl: ServerRout.baseURL,
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {"Authorization": "Basic aG90ZWw6aG90ZWxAMTIz"},
        responseType: ResponseType.json))
      ..interceptors.addAll([LogInterceptor()]);
  }

  static final instance = GetXAPI._();
  final sharedPreferences = SharedPreferences.getInstance();

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    final token =
        await LocalStorageManager.instance.getFromCache(ServerRout.keyToken);
    try {
      final res = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Authorization': token == null || token.isEmpty
                ? ServerRout.basicToken
                : "Bearer $token",
          },
        ),
      );
      if (res.statusCode == 200) {
        return res.data;
      } else {
        throw "some thing wrong";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({
    required String path,
    dynamic data,
    String contentType = "application/json",
  }) async {
    try {
      final token =
          await LocalStorageManager.instance.getFromCache(ServerRout.keyToken);
      final res = await _dio.post(
        path,
        data: data,
        options: Options(headers: {
          'Authorization': token == null || token.isEmpty
              ? ServerRout.basicToken
              : "Bearer $token",
          'Content-Type': contentType,
        }),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return res.data;
      }
      throw ("Something wrong");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({required String path, dynamic data}) async {
    final token =
        await LocalStorageManager.instance.getFromCache(ServerRout.keyToken);
    print("Get Token in put ---------------------${token}");
    try {
      final res = await _dio.put(
        options: Options(
          headers: {'Authorization': "Bearer $token"},
        ),
        path,
        data: data,
      );
      if (res.statusCode == 200) {
        return res.data;
      }
      throw ("Something wrong");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resetPassword(
      String oldPassword, String newPassword, String comfirmPassword) async {
    try {
      final res = await _dio.post(
        '/reset_password',
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
          "comfirmPassword": comfirmPassword,
        },
      );
      if (res.statusCode == 200) {
        print("reset Success");
      } else {
        throw ("fail");
      }
    } catch (e) {
      rethrow;
    }
  }
}
