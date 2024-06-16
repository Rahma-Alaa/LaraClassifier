import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getPaymentMethods(String countryCode, String sort) async {
  final url = Uri.parse('http://127.0.0.1/api/paymentMethods?countryCode=US&sort=-lft')
      .replace(queryParameters: {
    'countryCode': countryCode,
    'sort': sort,
  });

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
    throw Exception('Failed to fetch payment methods: ${response.reasonPhrase}');
  }
}

Future<Map<String, dynamic>> getPaymentMethod(int id) async {
  final url = Uri.parse('https://demo.laraclassifier.local/api/paymentMethods/$id');

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Content-Language': 'en',
    'X-AppApiToken': 'Uk1DSFlVUVhIRXpHbWt6d2pIZjlPTG15akRPN2tJTUs=',
    'X-AppType': 'docs',
  };

  final response = await http.get(url, headers: headers);
  print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 404) {
    throw Exception('Payment method not found: ${response.reasonPhrase}');
  } else {
    throw Exception('Failed to fetch payment method: ${response.reasonPhrase}');
  }
}
