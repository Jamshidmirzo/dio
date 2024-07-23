import 'package:dio/dio.dart';
import 'package:lesson81/core/network/dio_product.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/models/user.dart';

class DioServiceProduct {
  final _dioClient = DioProduct();

  Future<List<Product>?> getProducts() async {
    try {
      final response = await _dioClient.get(url: '/products');
      List<Product> products = [];
      for (var element in response.data) {
        products.add(Product.fromMap(element));
        return products;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addProducts(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post(url: '/products', data: data);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> editProduct(Map<String, dynamic> data, int id) async {
    try {
      final response =
          await _dioClient.put(url: '/products', data: data, id: id);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      final response = await _dioClient.delete(url: '/products', id: id);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
