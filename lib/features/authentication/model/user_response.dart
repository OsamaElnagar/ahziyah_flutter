import 'package:hive_ce_flutter/hive_flutter.dart';

part 'user_response.g.dart';

@HiveType(typeId: 0)
class UserResponse extends HiveObject {
  @HiveField(0)
  final User user;

  @HiveField(1)
  final String token;

  UserResponse({
    required this.user,
    required this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }

  UserResponse copyWith({
    User? user,
    String? token,
  }) {
    return UserResponse(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String? avatar;

  @HiveField(5)
  final String? address;

  @HiveField(6)
  final String? role;

  @HiveField(7)
  final DateTime? emailVerifiedAt;

  @HiveField(8)
  final DateTime? createdAt;

  @HiveField(9)
  final DateTime? updatedAt;

  User({
    required this.id,
    this.email,
    this.name,
    this.phone,
    this.avatar,
    this.address,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] is String ? int.parse(json['id']) : json['id'] ?? 0,
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        avatar: json['avatar'],
        address: json['address'],
        role: json['role'],
        emailVerifiedAt: json['email_verified_at'] != null
            ? DateTime.parse(json['email_verified_at'])
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'avatar': avatar,
        'address': address,
        'role': role,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? phone,
    String? avatar,
    String? address,
    String? role,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      address: address ?? this.address,
      role: role ?? this.role,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
