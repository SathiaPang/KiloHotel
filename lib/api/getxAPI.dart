import 'package:dio/dio.dart';
import 'package:hotel/constant/server_rout.dart';

class GetXAPI {
  late Dio _dio;

  GetXAPI._() {
    _dio = Dio(BaseOptions(
        baseUrl: ServerRout.baseURL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {"Authorization": "Basic aG90ZWw6aG90ZWxAMTIz"},
        responseType: ResponseType.json))
      ..interceptors.addAll([LogInterceptor()]);
  }

  static final instance = GetXAPI._();

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParameters);
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({required String path, dynamic data}) async {
    try {
      final res = await _dio.post(path, data: data);
      if (res.statusCode == 200) {
        return res.data;
      }
      throw ("Something wrong");
    } catch (e) {
      rethrow;
    }
  }

  put({required String path, required Map<String, String> data}) {}
}
