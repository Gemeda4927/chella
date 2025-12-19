class Registerentity {
  final String id;
  final String username;
  final String fullName;
  final String referralCode;
  final String? referredBy;
  final int amount;
  final int totalEarned;
  final int totalReferred;

  Registerentity({
    required this.id,
    required this.username,
    required this.fullName,
    required this.referralCode,
    this.referredBy,
    required this.amount,
    required this.totalEarned,
    required this.totalReferred,
  });
}
