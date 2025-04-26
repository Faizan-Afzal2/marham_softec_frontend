class Endpoints {
  // Base URL
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = 'uth/register';

  // Helper method to get full URL
  static String getUrl(String endpoint) => baseUrl + endpoint;
}
