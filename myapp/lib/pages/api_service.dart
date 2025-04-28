import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> fetchUser() async {
    final url = Uri.parse('https://reqres.in/api/users/2');

    final response = await http.get(
      url,
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
    );

    print('Status Code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = json.decode(response.body);
      return decoded['data'];
    } else {
      throw Exception('Failed to load user: ${response.statusCode} - ${response.body}');
    }
  }
}
