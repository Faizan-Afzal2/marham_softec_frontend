import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';
import 'package:marham_softec/features/addTask/view/controllers/add_task_by_text_controller.dart';
import 'package:provider/provider.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: pickedImage == null
                  ? Center(
                      child: Text(
                        'No Image Selected',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(pickedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(height: 32),
            BorderButton(
              text: 'Pick an Image',
              onPressed: pickImage,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Submit Image',
              onPressed: () {
                if (!isProcessing) {
                  processImage();
                }
              },
            ),
            if (isProcessing)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            if (extractedText.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Extracted Text:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      extractedText,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
