import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marham_softec/services/local_storage_service.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_exception.dart';

class UserService {
  final String baseUrl = 'http://192.168.0.188:3000/';

  Future fetchMe() async {
    final token = LocalStorageService.getString('access_token');

    final response = await http.get(
      Uri.parse('$baseUrl/auth/me'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    final jsonData = json.decode(response.body);
    return jsonData;
  }
}
