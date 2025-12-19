class UserEntity {
  final String id;
  final String username;
  final String fullName;
  final String accessToken;

  final String referralCode;
  final String refferedBy;

  final int amount;
  final int totalEarned;
  final int totalReffered;

  const UserEntity({
    required this.id,
    required this.username,
    required this.fullName,
    required this.accessToken,
    required this.referralCode,
    required this.refferedBy,
    required this.amount,
    required this.totalEarned,
    required this.totalReffered,
  });

  String welcomeBack() => 'Welcome back, $fullName';
}
