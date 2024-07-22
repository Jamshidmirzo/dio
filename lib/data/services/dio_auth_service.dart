import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';

class DioAuthService {
  final _dioClient = DioClient();

  Future<Response> register({
    required String name,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        url: '/register/',
        data: {
          // "name": name,
          "username": phone,
          "password": password,
        },
      );

      print(response);
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> verify({
    required String key,
    required int code,
  }) async {
    try {
      final response = await _dioClient.post(
        url: '/register/verify/',
        data: {
          "otp_key": key,
          "otp_code": code,
        },
      );

      print(response);
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
