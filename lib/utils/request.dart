import 'dart:convert';
import 'package:http/http.dart' as http;

Future<T> request<T>(
  String route, {
  String method = "GET",
  dynamic body,
}) async {
  late http.Response response;
  final headers = {'Content-Type': 'application/json'};
  // final url = Uri(host: '192.168.1.11', scheme: 'http', path: "api/$route", port: 5000);
  final url = Uri.parse('http://localhost:5000/api/$route');

  try {
    switch (method) {
      case 'DELETE':
        response = await http.delete(url, headers: headers);
        break;
      case 'GET':
        response = await http.get(url, headers: headers);
        break;
      case 'PUT':
        response = await http.put(
          url,
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      case 'POST':
        response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody as T;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  } catch (e) {
    rethrow;
  }
}
