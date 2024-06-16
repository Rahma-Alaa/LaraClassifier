import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchCategories({
  int parentId = 0,
  int nestedIncluded = 0,
  String embed = 'null',
  String sort = '-lft',
  int perPage = 2,
  int page = 1,
}) async {
  final url = Uri.https(
    'http://127.0.0.1/api/categories?sort=-lft&perPage=2&page=1',
    '/api/categories',
    {
      'parentId': parentId.toString(),
      'nestedIncluded': nestedIncluded.toString(),
      'embed': embed,
      'sort': sort,
      'perPage': perPage.toString(),
      'page': page.toString(),
    },
  );

  final headers = {
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
    throw Exception('Failed to fetch categories: ${response.reasonPhrase}');
  }
}
