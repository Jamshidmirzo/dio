import 'package:dio/dio.dart';
import 'package:lesson81/core/network/dio_client.dart';
import 'package:lesson81/data/models/user.dart';

class DioUsersService {
  final _dioClient = DioClient();

  Future<List<User>> getUsers() async {
    try {
      final response = await _dioClient.get(url: "/users");

      List<User> users = [];

      for (var userData in response.data['data']) {
        users.add(User.fromMap(userData));
      }

      return users;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
