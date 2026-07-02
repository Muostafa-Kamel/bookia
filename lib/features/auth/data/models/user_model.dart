import 'package:bookia/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;

  UserModel({required this.id, required super.name, required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
