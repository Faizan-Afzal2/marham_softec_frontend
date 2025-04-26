import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.188:3000/auth/register'),
      body: {
        'email': email,
        'password': password,
        'name': name,
      },
    );

    return json.decode(response.body);
  }

  Future logIn({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.188:3000/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    return json.decode(response.body);
  }
}
