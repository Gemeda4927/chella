class UserModel {
  final String?id;
  final String username;
  final String password;
  final String? role;

  const UserModel({
    this.id,
    required this.username,
    required this.password,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ,
      username: json['username'] as String,
      password: '',
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toLoginJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
