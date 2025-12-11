class UserModel {
  final int id;
  final String username;
  final String role;
  final String password;

  const UserModel({
    required this.id,
    required this.username,
    required this.role,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      password: json['password'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'role': role};
  }
}
