class RegisterRequest {
  final String email;
  final String password;
  final String fullName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.fullName,
  });

  Map<String, dynamic> toJson() => {
    'email': email.trim(),
    'password': password,
    'fullName': fullName.trim(),
  };
}

class RegisterResponse {
  final String id;
  final String email;
  final String fullName;
  final String token;

  RegisterResponse({
    required this.id,
    required this.email,
    required this.fullName,
    required this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      id: json['id'] ?? json['userId'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? json['name'] ?? '',
      token: json['token'] ?? json['accessToken'] ?? '',
    );
  }
}
