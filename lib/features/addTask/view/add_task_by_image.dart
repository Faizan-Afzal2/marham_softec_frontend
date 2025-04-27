import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';
import 'package:marham_softec/features/addTask/view/controllers/add_task_by_text_controller.dart';
import 'package:provider/provider.dart';

class AddTaskThroughImage extends StatefulWidget {
  const AddTaskThroughImage({super.key});

  @override
  State<AddTaskThroughImage> createState() => _AddTaskThroughImageState();
}

class _AddTaskThroughImageState extends State<AddTaskThroughImage> {
  XFile? pickedImage;
  final textRecognizer = TextRecognizer();
  bool isProcessing = false;
  String extractedText = '';

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => pickedImage = image);
    }
  }

  Future<void> processImage() async {
    if (pickedImage == null) return;

    setState(() => isProcessing = true);
    try {
      final inputImage = InputImage.fromFile(File(pickedImage!.path));
      final recognizedText = await textRecognizer.processImage(inputImage);
      // print('Extracted text: ${recognizedText.text}');

      setState(() {
        extractedText = recognizedText.text;
      });
      final controller =
          Provider.of<AddTaskByTextController>(context, listen: false);
      controller.createTaskWithAI(context: context, text: extractedText);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing image: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isProcessing = false);
      }
    }
  }

  @override
  void dispose() {
    textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task - Image'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedImage == null
                ? const Text('No Image Selected')
                : Image.file(File(pickedImage!.path), height: 200),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(20),
              child: BorderButton(
                text: 'Pick an image',
                onPressed: pickImage,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                text: 'Submit image',
                onPressed: () {
                  if (!isProcessing) {
                    processImage();
                  }
                },
              ),
            ),
            if (isProcessing) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
