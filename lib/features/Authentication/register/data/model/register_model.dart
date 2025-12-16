class RegisterModel {
  final String? id;
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
    required this.username,
    required this.fullName,
    this.password,
    this.referralCode,
    this.referredBy,
    this.amount = 0,
    this.totalEarned = 0,
    this.totalReferred = 0,
  });

  // For creating new user (request)
  Map<String, dynamic> toCreateJson() {
    return {
      'fullName': fullName.trim(),
      'username': username,
      'password': password,
      if (referredBy != null) 'referredBy': referredBy,
    };
  }

  // For response data
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as String?,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      referralCode: json['referralCode'] as String?,
      referredBy: json['referredBy'] as String?,
      amount: json['amount'] as int? ?? 0,
      totalEarned: json['totalEarned'] as int? ?? 0,
      totalReferred: json['totalReferred'] as int? ?? 0,
    );
  }

  // For sending updates
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
