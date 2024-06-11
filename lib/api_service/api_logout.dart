import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> logoutUser(int userId, String authToken) async {
  final url = Uri.parse('http://10.0.2.2/api/auth/logout/${userId.toString()}');

  final headers = {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Content-Language': 'en',
    'X-AppApiToken': 'YTJjclo1NFptanJMYWV6cTFGYTlsYUNqNVlRYmlYbno=',
    'X-AppType': 'docs',
  };

  final response = await http.get(url, headers: headers);
  print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to logout: ${response.reasonPhrase}');
  }
}
