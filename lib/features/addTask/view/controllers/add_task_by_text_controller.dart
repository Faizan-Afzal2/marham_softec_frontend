import 'package:flutter/material.dart';
import 'package:marham_softec/core/widgets/custom_snackbar.dart';
import 'package:marham_softec/features/addTask/model/category_model.dart';
import 'package:marham_softec/features/addTask/model/create_task_model.dart';
import 'package:marham_softec/services/create_task_service.dart';
import 'package:marham_softec/services/local_storage_service.dart';

class AddTaskByTextController with ChangeNotifier {
  CreateTaskervice _createtaskService = new CreateTaskervice();

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  String? selectedCategory;

  List<Datum> categories = [];
  DateTime dueDate = DateTime.now();
  // final List<String> categories = ['Work', 'Personal', 'Study', 'Other'];

  Future<void> _pickDueDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != dueDate) {
      dueDate = picked;
      notifyListeners();
    }
  }

  void loadCategories() {
    print("Function started");
    _createtaskService.getCategories().then((response) {
      final categoryModelResponse = categoryModelFromJson(response);
      categories = categoryModelResponse.data;
      print(categories);
      notifyListeners();
    });
  }

  void createTask(context) async {
    final response = await _createtaskService.createtask(
        categoryName: selectedCategory,
        title: taskNameController.text,
        description: taskDescriptionController.text,
        date: dueDate);
    print(response);
    if (response['success']) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackbar(
            title: "Success",
            message: "Account created successfully",
            icon: Icons.check_circle,
            backgroundColor: Colors.green,
          ),
        );
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          CustomSnackbar(
            title: "Error",
            message: "Error while creating task",
            icon: Icons.error,
            backgroundColor: Colors.red,
          ),
        );
    }
  }

  void logout() {
    LocalStorageService.remove('access_token');
    notifyListeners();
  }
}
