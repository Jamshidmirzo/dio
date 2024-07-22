import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson81/data/models/product.dart';

class Products extends StatelessWidget {
  final Product product;
  const Products({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(
          fit: BoxFit.cover,
          product.images[0],
        ),
      ),
      title: Text(product.title),
      subtitle: Text(product.category.name),
    );
    ;
  }
}
