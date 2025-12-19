class UserModel {
  final String id;
  final String username;
  final String fullName;
  final String accessToken;
  final String referralCode;
  final String refferedBy;
  final int amount;
  final int totalEarned;
  final int totalReffered;

  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      accessToken: json['accessToken'] as String,
      referralCode: json['referralCode'] as String,
      refferedBy: json['refferedBy'] as String,
      amount: json['amount'] as int,
      totalEarned: json['totalEarned'] as int,
      totalReffered: json['totalReffered'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'accessToken': accessToken,
      'referralCode': referralCode,
      'refferedBy': refferedBy,
      'amount': amount,
      'totalEarned': totalEarned,
      'totalReffered': totalReffered,
    };
  }
}
