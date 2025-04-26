import 'package:flutter/material.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class AddTaskThroughText extends StatefulWidget {
  const AddTaskThroughText({super.key});

  @override
  State<AddTaskThroughText> createState() => _AddTaskThroughTextState();
}

class _AddTaskThroughTextState extends State<AddTaskThroughText> {
   TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  DateTime dueDate = DateTime.now();

  Future<void> _pickDueDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != dueDate) {
      setState(() {
        dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: CustomAppBar(title: 'Add Task - Text'),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppTextField(
                  controller: taskNameController,
                  hintText: 'Task name',
                  // prefixIcon: Icons.task,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: taskDescriptionController,
                  hintText: 'Task Description',
                  // prefixIcon: Icons.description,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: taskCategoryController,
                  hintText: 'Category',
                  // prefixIcon: Icons.description,
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Selected Date: ${dueDate.toLocal().toString().split(' ')[0]}'),

                    SizedBox(height: 20),
                    Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child:
                        BorderButton(text: 'Pick a Date', onPressed: _pickDueDate)),
                    
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child:
                        PrimaryButton(text: 'Submit Task', onPressed: () {})),
              ],
            ),
          ),
        );
  }
}