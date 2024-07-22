// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Categorys {
  int id;
  String name;
  String image;
  Categorys({
    required this.id,
    required this.name,
    required this.image,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Categorys.fromMap(Map<String, dynamic> map) {
    return Categorys(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorys.fromJson(String source) => Categorys.fromMap(json.decode(source) as Map<String, dynamic>);
}
