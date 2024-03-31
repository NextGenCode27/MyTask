abstract class UserEntity {
  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final DateTime updatedAt;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.updatedAt,
  });
}
