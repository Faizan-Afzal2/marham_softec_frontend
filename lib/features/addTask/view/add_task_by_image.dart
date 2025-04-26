import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class AddTaskThroughImage extends StatefulWidget {
  const AddTaskThroughImage({super.key});

  @override
  State<AddTaskThroughImage> createState() => _AddTaskThroughImageState();
}

class _AddTaskThroughImageState extends State<AddTaskThroughImage> {
XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
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
  }
}