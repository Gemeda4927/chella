import 'dart:convert';
import 'package:chella/features/Authentication/register/data/model/register_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final http.Client client;
  final String baseUrl;

  AuthRepository({
    required this.client,
    this.baseUrl = 'https://your-api.com/api',
  });

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterResponse.fromJson(json.decode(response.body));
      } else {
        final error = json.decode(response.body);
        throw Exception(error['message'] ?? 'Registration failed');
      }
    } on FormatException {
      throw Exception('Invalid server response');
    } catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }
}
