import 'package:dio/dio.dart';

class DioProduct {
  final _dio = Dio();

  DioProduct._private() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 3)
      ..responseType = ResponseType.json
      ..baseUrl = "https://api.escuelajs.co/api/v1";
  }

  static final _singletonConstructor = DioProduct._private();

  factory DioProduct() {
    return _singletonConstructor;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      {required String url,
      required Map<String, dynamic> data,
      required int id}) async {
    try {
      print(data);
      final response = await _dio.put('$url/$id', data: data);
      print(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
    Future<Response> delete(
      {required String url,
      required int id}) async {
    try {

      final response = await _dio.put('$url/$id');
      print(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
