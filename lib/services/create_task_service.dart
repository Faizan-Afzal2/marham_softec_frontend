import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marham_softec/services/local_storage_service.dart';

class CreateTaskervice {
  Future createtask(
      {required String title,
      String? description,
      DateTime? date,
      String? categoryName}) async {
    final token = LocalStorageService.getString('access_token');
    final response = await http.post(
      Uri.parse('http://192.168.0.188:3000/task/add'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "title": title,
        "description": description ?? "",
        "dueDate": date?.toIso8601String() ?? "",
        "categoryName": categoryName ?? ""
      },
    );

    return json.decode(response.body);
  }

  Future getCategories() async {
    final response = await http.get(
      Uri.parse('http://192.168.0.188:3000/category/get-all'),
    );

    return response.body;
  }
}
