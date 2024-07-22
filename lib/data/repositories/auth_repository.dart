import 'package:dio/dio.dart';
import 'package:lesson81/data/services/dio_auth_service.dart';

class AuthRepository {
  final DioAuthService _dioAuthService;

  AuthRepository({required DioAuthService dioAuthService})
      : _dioAuthService = dioAuthService;

  Future<Response> register({
    required String name,
    required String phone,
    required String password,
  }) async {
    return await _dioAuthService.register(
      name: name,
      phone: phone,
      password: password,
    );
  }

  Future<Response> verify({
    required String key,
    required int code,
  }) async {
    return await _dioAuthService.verify(
      key: key,
      code: code,
    );
  }
}
