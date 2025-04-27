import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
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
  TextEditingController dueDateController = TextEditingController(); // Added controller
  
  String? selectedCategory;

  List<Datum> categories = [];
  DateTime dueDate = DateTime.now();

  AddTaskByTextController() {
    updateDueDateText(); // Initialize the controller text
  }

  Future<void> pickDueDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != dueDate) {
      dueDate = picked;
      updateDueDateText();
      notifyListeners();
    }
  }

  void updateDueDateText() {
    dueDateController.text = formatDate(dueDate);
  }

  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date); // Formats as "15 Nov 2023"
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

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    taskCategoryController.dispose();
    dueDateController.dispose(); // Clean up controller
    super.dispose();
  }

  void logout() {
    LocalStorageService.remove('access_token');
    notifyListeners();
  }
}

void showQuickAddDialog(BuildContext context) {
  TextEditingController taskTextController = TextEditingController();

  showDialog(
    
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.grey.shade100,
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Quick Add Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: SizedBox(
        height: 200, // Set fixed height
        width: MediaQuery.of(context).size.width * 0.9, 
        child: TextField(
  controller: taskTextController,
  maxLines: null, // Let it grow
  expands: true, // Fill all available space
  textAlignVertical: TextAlignVertical.top, // <-- Top alignment
  textAlign: TextAlign.start, // <-- Left alignment
  decoration: InputDecoration(
    hintText: 'Enter task details...',
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),

      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(color: AppColors.backgroundDark)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            String taskText = taskTextController.text.trim();
            if (taskText.isNotEmpty) {
              print('User entered task: $taskText');
            }
            Navigator.of(context).pop();
          },
          child: Text('Add Task',style: TextStyle(color: AppColors.backgroundLight),),
        ),
      ],
    ),
  );
}
