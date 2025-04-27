import 'package:flutter/material.dart';
import 'package:marham_softec/models/user_model_with_tasks.dart';
import 'package:marham_softec/services/local_storage_service.dart';
import 'package:marham_softec/services/user_service.dart';

class RootScreenController with ChangeNotifier {
  UserService _userService = new UserService();

  // late UserModel user;
  bool isLoading = false;

  DateTime dueDate = DateTime.now();
  // final List<String> categories = ['Work', 'Personal', 'Study', 'Other'];

  // Future<void> fetchMe() async {
  //   isLoading = true;
  //   notifyListeners();
  //   try {
  //     final response = await _userService.fetchMe();
  //     print(response);
  //     if (response.success) {
  //       final apiData = UserApiResponse.fromJson(response);
  //       user = apiData.data;
  //     }
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // void createTask(context) async {
  //   final response = await _createtaskService.createtask(
  //       categoryName: selectedCategory,
  //       title: taskNameController.text,
  //       description: taskDescriptionController.text,
  //       date: dueDate);
  //   print(response);
  //   if (response['success']) {
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(
  //         CustomSnackbar(
  //           title: "Success",
  //           message: "Account created successfully",
  //           icon: Icons.check_circle,
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //   } else {
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(
  //         CustomSnackbar(
  //           title: "Error",
  //           message: "Error while creating task",
  //           icon: Icons.error,
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //   }
  // }

  void logout() {
    LocalStorageService.remove('access_token');
    notifyListeners();
  }
}
