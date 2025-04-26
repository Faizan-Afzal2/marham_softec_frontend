import 'package:flutter/material.dart';
import 'package:marham_softec/features/addTask/view/add_task_by_text.dart';
import 'package:marham_softec/features/addTask/view/add-task_by_voice.dart';
import 'package:marham_softec/features/addTask/view/add_task_by_image.dart';

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

  @override
  Widget build(BuildContext context) {
    // Get the 'task type' key passed from the dialog

    // Switch the UI based on the type
    switch (widget.data) {
      case 'text':
        return AddTaskThroughText();
      case 'voice':
        return AddTaskThroughVoice();
      case 'image':
        return AddTaskThroughImage();

      default:
        return Scaffold(
          body: Center(
            child: Text('Invalid Task Type', style: TextStyle(fontSize: 20)),
          ),
        );
    }
  }
}
