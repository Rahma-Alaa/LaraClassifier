import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> updateUser(int id,String email, String name,String phone) async {
  final url = Uri.parse('http://10.0.2.2/api/users/${id.toString()}');

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Content-Language': 'en',
    'X-AppApiToken': 'YTJjclo1NFptanJMYWV6cTFGYTlsYUNqNVlRYmlYbno=',
    'X-AppType': 'docs',
  };

  final body = {
    'email': email,
    'name': name,
    'phone': phone,
  };
print("hello");
  final response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(body),
  );
  print ("innnnn");
  print (response);
  if (response.statusCode == 200 || response.statusCode ==400) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to update: ${response.reasonPhrase}');
  }
}
