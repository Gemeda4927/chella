class UserEntity {
  final int? id;
  final String username;
  final String? role;
  final String password;

  const UserEntity({
    this.id,
    required this.username,
    required this.password,
    this.role,
  });

  String welcomeBack() {
    return 'Welcome back, $username';
  }
}
