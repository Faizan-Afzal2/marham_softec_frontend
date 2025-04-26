import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class AddTaskScreen extends StatefulWidget {
  final String data;

  const AddTaskScreen({super.key, required this.data});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  DateTime dueDate = DateTime.now();
  XFile? pickedImage;
  bool isRecording = false;

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
    // Get the 'task type' key passed from the dialog

    // Switch the UI based on the type
    switch (widget.data) {
      case 'text':
        return Scaffold(
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

      case 'voice':
        return Scaffold(
          appBar: CustomAppBar(title: 'Add Task - Voice'),
          body: Center(
            // child: Text(widget.data),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 125,
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                    icon: Icon(
                      isRecording
                          ? Icons.stop_circle_outlined
                          : Icons.mic_none_outlined,
                      size: 120,
                      color: AppColors.backgroundDark,
                    ),
                    onPressed: () {
                      // TODO: Implement Voice Record Start/Stop functionality
                    },
                  ),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: PrimaryButton(
                        text: 'Submit recording', onPressed: () {})),
                SizedBox(height: 54),
              ],
            ),
          ),
        );

      case 'image':
        return Scaffold(
          appBar: CustomAppBar(title: 'Add Task - Image'),
          body: Center(
            // child: Text(widget.data),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pickedImage == null
                    ? const Text('No Image Selected')
                    : Image.file(File(pickedImage!.path), height: 200),
                const SizedBox(height: 24),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child:
                        BorderButton(text: 'Pick an image', onPressed: () {})),
                const SizedBox(height: 16),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child:
                        PrimaryButton(text: 'Submit image', onPressed: () {})),
              ],
            ),
          ),
        );

      default:
        return Scaffold(
          body: Center(
            child: Text('Invalid Task Type', style: TextStyle(fontSize: 20)),
          ),
        );
    }
  }
}
