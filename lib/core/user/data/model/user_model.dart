import 'package:my_task/core/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.photoUrl,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['avatar_url'] ?? '',
      updatedAt: map['updated_at'] ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': username,
        'email': email,
        'avatar_url': photoUrl,
        'updated_at': updatedAt,
      };

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? photoUrl,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
