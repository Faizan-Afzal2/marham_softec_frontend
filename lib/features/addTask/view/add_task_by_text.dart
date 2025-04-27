import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';
import 'package:marham_softec/features/addTask/view/controllers/add_task_by_text_controller.dart';
import 'package:provider/provider.dart';

class AddTaskThroughText extends StatefulWidget {
  const AddTaskThroughText({super.key});

  @override
  State<AddTaskThroughText> createState() => _AddTaskThroughTextState();
}

class _AddTaskThroughTextState extends State<AddTaskThroughText> {
  DateTime dueDate = DateTime.now();
  // final List<String> categories = ['Work', 'Personal', 'Study', 'Other'];

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
  void initState() {
    super.initState();
    // Schedule the Provider access for after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller =
          Provider.of<AddTaskByTextController>(context, listen: false);
      controller.loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddTaskByTextController>(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task - Text'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              controller: controller.taskNameController,
              hintText: 'Task name',
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: controller.taskDescriptionController,
              hintText: 'Task Description',
            ),
            const SizedBox(height: 16),
            // Category Chips
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Category',
                    style: TextStyle(color: Colors.grey.shade600)),
              ),
            ),
            Wrap(
              spacing: 8,
              children: controller.categories.map((category) {
                final isSelected = category.name == controller.selectedCategory;
                return ChoiceChip(
                  label: Text(category.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      controller.selectedCategory =
                          selected ? category.name : null;
                      controller.taskCategoryController.text =
                          controller.selectedCategory ?? '';
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Selected Date: ${dueDate.toLocal().toString().split(' ')[0]}'),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: BorderButton(
                      text: 'Pick a Date', onPressed: _pickDueDate),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                  text: 'Submit Task',
                  onPressed: () {
                    controller.createTask(context);
                    context.pop();
                    // controller.logout();
                    // context.push("/");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
