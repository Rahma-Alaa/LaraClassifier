import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String email, String password) async {
  final url = Uri.parse('http://10.0.2.2/api/auth/login');

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Content-Language': 'en',
    'X-AppApiToken': 'YTJjclo1NFptanJMYWV6cTFGYTlsYUNqNVlRYmlYbno=',
    'X-AppType': 'docs',
  };

  final body = {
    'email': email,
    'password': password,
    'auth_field': 'email',
    'phone': 'null',
    'phone_country': 'null',
    'captcha_key': 'dolor',
  };

  final response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200 || response.statusCode ==400) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to login: ${response.reasonPhrase}');
  }
}
