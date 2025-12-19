class RegisterModel {
  final String? id;
  final String? accessToken;
  final String username;
  final String fullName;
  final String? password;
  final String? referralCode;
  final String? referredBy;
  final int? amount;
  final int? totalEarned;
  final int? totalReferred;

  RegisterModel({
    this.id,
    this.accessToken,
    required this.username,
    required this.fullName,
    this.password,
    this.referralCode,
    this.referredBy,
    this.amount = 0,
    this.totalEarned = 0,
    this.totalReferred = 0,
  });



  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as String?,
      username: json['username'] as String,
      accessToken: json['accessToken'] as String,
      fullName: json['fullName'] as String,
      referralCode: json['referralCode'] as String?,
      referredBy: json['referredBy'] as String?,
      amount: json['amount'] as int? ?? 0,
      totalEarned: json['totalEarned'] as int? ?? 0,
      totalReferred: json['totalReferred'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      'fullName': fullName.trim(),
      if (referralCode != null) 'referralCode': referralCode,
      if (referredBy != null) 'referredBy': referredBy,
      if (amount != null) 'amount': amount,
      if (totalEarned != null) 'totalEarned': totalEarned,
      if (totalReferred != null) 'totalReferred': totalReferred,
    };
  }
}
