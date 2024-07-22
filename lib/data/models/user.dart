import 'dart:convert';

class User {
  final String id;
  String email;
  String firstName;
  String lastName;
  String avatarUrl;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'first_name': firstName});
    result.addAll({'last_name': lastName});
    result.addAll({'avatar': avatarUrl});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    print(map);
    return User(
      id: map['id'].toString(),
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      avatarUrl: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl)';
  }
}
