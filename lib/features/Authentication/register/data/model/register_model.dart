class RegisterModel {
  final String? id;
  final String? accessToken;
  final String username;
  final String fullName;
  final String? referralCode;
  final String? refferedBy; // match API spelling
  final int amount;
  final int totalEarned;
  final int totalReffered; // match API spelling

  RegisterModel({
    this.id,
    this.accessToken,
    required this.username,
    required this.fullName,
    this.referralCode,
    this.refferedBy,
    this.amount = 0,
    this.totalEarned = 0,
    this.totalReffered = 0,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as String?,
      username: json['username'] as String? ?? "",
      accessToken: json['accessToken'] as String?, // can be null
      fullName: json['fullName'] as String? ?? "",
      referralCode: json['referralCode'] as String?,
      refferedBy: json['refferedBy'] as String?, // nullable
      amount: json['amount'] as int? ?? 0,
      totalEarned: json['totalEarned'] as int? ?? 0,
      totalReffered: json['totalReffered'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      'fullName': fullName.trim(),
      if (accessToken != null) 'accessToken': accessToken,
      if (referralCode != null) 'referralCode': referralCode,
      if (refferedBy != null) 'refferedBy': refferedBy,
      'amount': amount,
      'totalEarned': totalEarned,
      'totalReffered': totalReffered,
    };
  }
}
