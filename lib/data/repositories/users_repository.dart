import 'package:dio/dio.dart';
import 'package:lesson81/data/services/dio_users_service.dart';

import '../models/user.dart';

class UsersRepository {
  final DioUsersService _dioUsersService;

  UsersRepository({required DioUsersService dioUsersService})
      : _dioUsersService = dioUsersService;

  Future<List<User>> getUsers() async {
    return await _dioUsersService.getUsers();
  }
}
