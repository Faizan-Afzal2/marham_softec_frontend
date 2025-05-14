import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class BaseApiService {
  final AppConfig _config = AppConfig();
  final http.Client _client = http.Client();

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _client
          .get(
            Uri.parse(endpoint),
            headers: _config.defaultHeaders,
          )
          .timeout(_config.connectionTimeout);
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client
          .post(
            Uri.parse(endpoint),
            headers: _config.defaultHeaders,
            body: jsonEncode(body),
          )
          .timeout(_config.connectionTimeout);
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client
          .put(
            Uri.parse(endpoint),
            headers: _config.defaultHeaders,
            body: jsonEncode(body),
          )
          .timeout(_config.connectionTimeout);
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _client
          .delete(
            Uri.parse(endpoint),
            headers: _config.defaultHeaders,
          )
          .timeout(_config.connectionTimeout);
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }

  Exception _handleError(dynamic error) {
    if (error is Exception) {
      return error;
    }
    return Exception('An unexpected error occurred: $error');
  }

  void dispose() {
    _client.close();
  }
}
