import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  String extractedText = '';
  bool isLoading = false;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => pickedImage = image);
    }
  }

  Future<String> _getTessDataPath() async {
    final dir = await getApplicationDocumentsDirectory();
    final tessDataDir = Directory('${dir.path}/tessdata');

    if (!await tessDataDir.exists()) {
      await tessDataDir.create(recursive: true);
    }

    final engFile = File('${tessDataDir.path}/eng.traineddata');
    if (!await engFile.exists()) {
      final byteData = await rootBundle.load('assets/tessdata/eng.traineddata');
      await engFile.writeAsBytes(byteData.buffer.asUint8List());
    }

    return dir.path;
  }

// Modified _extractText method
  Future<void> _extractText() async {
    if (pickedImage == null) return;

    setState(() => isLoading = true);

    try {
      final tessDataPath = await _getTessDataPath();

      final text = await FlutterTesseractOcr.extractText(
        pickedImage!.path,
        language: 'eng',
        args: {
          "preserve_interword_spaces": "1",
          "psm": "4",
          "oem": "3",
          "tessDataPath": tessDataPath,
        },
      );

      setState(() => extractedText = text);
      _showExtractedText(text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showExtractedText(String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Extracted Text'),
        content: SingleChildScrollView(child: Text(text)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task - Image'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) const CircularProgressIndicator(),
            if (!isLoading && pickedImage != null)
              Image.file(File(pickedImage!.path), height: 200),
            if (!isLoading && pickedImage == null)
              const Text('No Image Selected'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(20),
              child: BorderButton(
                text: 'Pick an image',
                onPressed: _pickImage,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                text: 'Process Image',
                onPressed: () {
                  if (extractedText.isEmpty) {
                    _extractText().catchError((e) {
                      print('Error: ${e.toString()}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
