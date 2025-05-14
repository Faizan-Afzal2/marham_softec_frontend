import 'dart:io';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  // Base URLs
  String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else if (Platform.isIOS) {
      return 'http://localhost:3000';
    } else {
      return 'http://192.168.1.7:3000';
    }
  }

  // API Endpoints
  String get loginEndpoint => '$baseUrl/auth/login';
  String get registerEndpoint => '$baseUrl/auth/register';

  // Add other endpoints as needed
  // String get profileEndpoint => '$baseUrl/profile';
  // String get settingsEndpoint => '$baseUrl/settings';

  // API Headers
  Map<String, String> get defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  // Timeouts
  Duration get connectionTimeout => const Duration(seconds: 30);
  Duration get receiveTimeout => const Duration(seconds: 30);

  // Other configuration constants
  static const int maxRetries = 3;
  static const int pageSize = 20;
}
