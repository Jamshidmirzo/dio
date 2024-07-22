// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:lesson81/data/models/category.dart';

class Product {
  int id;
  String title;
  String description;
  Categorys category;
  List images;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category.toMap(),
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: Categorys.fromMap(map['category'] as Map<String, dynamic>),
      images: List.from(
        (map['images'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
