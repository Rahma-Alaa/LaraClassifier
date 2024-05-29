import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  ApiService({required this.baseUrl});

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Content-Language': 'en',
        'X-AppApiToken': 'Uk1DSFlVUVhIRXpHbWt6d2pIZjlPTG15akRPN2tJTUs=',
        'X-AppType': 'docs',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'auth_field': 'email',
        'captcha_key': 'aut',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        await storage.write(key: 'authToken', value: data['extra']['authToken']);
      } else {
        throw Exception('Failed to login: ${data['message']}');
      }
    } else {
      throw Exception('Failed to login: ${response.reasonPhrase}');
    }
  }

  Future<void> signUp(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Content-Language': 'en',
        'X-AppApiToken': 'Uk1DSFlVUVhIRXpHbWt6d2pIZjlPTG15akRPN2tJTUs=',
        'X-AppType': 'docs',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        // Handle successful registration
      } else {
        throw Exception('Failed to sign up: ${data['message']}');
      }
    } else {
      throw Exception('Failed to sign up: ${response.reasonPhrase}');
    }
  }

  Future<void> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/forgot-password'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Content-Language': 'en',
        'X-AppApiToken': 'Uk1DSFlVUVhIRXpHbWt6d2pIZjlPTG15akRPN2tJTUs=',
        'X-AppType': 'docs',
      },
      body: jsonEncode({
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (!data['success']) {
        throw Exception('Failed to reset password: ${data['message']}');
      }
    } else {
      throw Exception('Failed to reset password: ${response.reasonPhrase}');
    }
  }
}
