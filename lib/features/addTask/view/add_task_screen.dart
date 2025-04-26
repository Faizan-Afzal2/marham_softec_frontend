import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
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
    print('Data received: ${widget.data}');
  }

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskSubtasksController = TextEditingController();
  DateTime dueDate = DateTime.now();
  XFile? pickedImage;
  bool isRecording = false;

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
                TextField(
                  controller: taskNameController,
                  decoration: const InputDecoration(
                    labelText: 'Task Name',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: taskDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Task Description',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: taskSubtasksController,
                  decoration: const InputDecoration(
                    labelText: 'Sub Tasks',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text('Due Date: ${dueDate.toLocal()}'),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Date Picker functionality
                      },
                      child: const Text('Pick Date'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Text Task Submit functionality
                  },
                  child: const Text('Submit Task'),
                ),
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
                    child: PrimaryButton(
                        text: 'Pick an image', onPressed: () {})),
                const SizedBox(height: 16),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: PrimaryButton(
                        text: 'Submit image', onPressed: () {})),
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
