import 'package:chella/features/Authentication/login/domain/enitity/user_entity.dart';

class RegisterModel extends UserEntity {
  RegisterModel({
    required String id,
    required String username,
    required String fullName,
    required String accessToken,
    required String referralCode,
    required String refferedBy,
    required int amount,
    required int totalEarned,
    required int totalReffered,
  }) : super(
         id: id,
         username: username,
         fullName: fullName,
         accessToken: accessToken,
         referralCode: referralCode,
         refferedBy: refferedBy,
         amount: amount,
         totalEarned: totalEarned,
         totalReffered: totalReffered,
       );

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['_id'] ?? json['id'] ?? '',
      username: json['username'] ?? '',
      fullName: json['fullName'] ?? '',
      accessToken: json['accessToken'] ?? '',
      referralCode: json['referralCode'] ?? '',
      refferedBy: json['refferedBy'] ?? '',
      amount: json['amount'] != null
          ? int.tryParse(json['amount'].toString()) ?? 0
          : 0,
      totalEarned: json['totalEarned'] != null
          ? int.tryParse(json['totalEarned'].toString()) ?? 0
          : 0,
      totalReffered: json['totalReffered'] != null
          ? int.tryParse(json['totalReffered'].toString()) ?? 0
          : 0,
    );
  }
}
