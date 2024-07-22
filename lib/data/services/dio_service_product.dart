import 'package:dio/dio.dart';
import 'package:lesson81/core/network/dio_product.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/models/user.dart';

class DioServiceProduct {
  final _dioClient = DioProduct();
  Future<List<Product>?> getProducts() async {
    try {
      final responce = await _dioClient.get(url: '/products');
      List<Product> products = [];
      for (var element in responce.data) {
        products.add(Product.fromMap(element));
        return products;
      }
    } catch (e) {
      rethrow;
    }
  }
}
