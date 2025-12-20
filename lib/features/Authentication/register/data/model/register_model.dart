class RegisterModel {
  final String? id;
  final String? accessToken;
  final String username;
  final String fullName;
  final String? referralCode;
  final String? refferedBy;
  final int amount;
  final int totalEarned;
  final int totalReffered;
  final bool isRegistered; 

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
    this.isRegistered = false,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as String?,
      username: json['username'] ?? "",
      accessToken: json['accessToken'] as String?,
      fullName: json['fullName'] ?? "",
      referralCode: json['referralCode'] as String?,
      refferedBy: json['refferedBy'] as String?,
      amount: json['amount'] as int? ?? 0,
      totalEarned: json['totalEarned'] as int? ?? 0,
      totalReffered: json['totalReffered'] as int? ?? 0,
      isRegistered: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      'fullName': fullName,
      if (accessToken != null) 'accessToken': accessToken,
      if (referralCode != null) 'referralCode': referralCode,
      if (refferedBy != null) 'refferedBy': refferedBy,
      'amount': amount,
      'totalEarned': totalEarned,
      'totalReffered': totalReffered,
      'isRegistered': isRegistered,
    };
  }

  RegisterModel copyWith({
    String? id,
    String? accessToken,
    String? username,
    String? fullName,
    String? referralCode,
    String? refferedBy,
    int? amount,
    int? totalEarned,
    int? totalReffered,
    bool? isRegistered,
  }) {
    return RegisterModel(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      referralCode: referralCode ?? this.referralCode,
      refferedBy: refferedBy ?? this.refferedBy,
      amount: amount ?? this.amount,
      totalEarned: totalEarned ?? this.totalEarned,
      totalReffered: totalReffered ?? this.totalReffered,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
