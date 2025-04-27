import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/utils/functions.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';

class TaskDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  TaskDetailScreen({super.key, required this.data});

  // Corresponding colors for categories
  final Map<String, Color> categoryColors = {
    'Work': Colors.blue[200]!,
    'Personal': Colors.green[200]!,
    'Health': Colors.orange[200]!,
  };

  @override
  Widget build(BuildContext context) {
    final String taskName = data['title'];
    final String description = data['description'];

    final String category = data['category'];
    final String dueDate = data['dueDate'];
    final List<dynamic> subtasks = data['subtasks'];
    print(data);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.backgroundLight),
                onPressed: () {
                  context.pop();
                },
              ),
        title: Text('Detail screen',style: TextStyle(color: AppColors.backgroundLight),),
        backgroundColor: AppColors.backgroundDark,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline,color:  AppColors.backgroundLight,), // The icon you want
            onPressed: () {
              // Add your onPressed functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: AppColors.backgroundDark,
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                  ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      taskName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.backgroundLight),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(description,style: TextStyle(color: AppColors.backgroundLight),),
                  SizedBox(height: 16),
                  // Chip(label: Text(category), backgroundColor: Colors.white),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors
                              .backgroundDark, // Light background color
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        padding: EdgeInsets.all(8), // Space inside the square
                        child: Icon(
                          Icons.calendar_month,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                          'Due: ${DateFormat('d MMM yyyy').format(DateTime.parse(dueDate))}',style: TextStyle(color: AppColors.backgroundLight),),
                      Spacer(),
                      Chip(
                          label: Text(category),
                          backgroundColor: categoryColors[category] ?? Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subtasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(subtasks[index]),
                  leading: Icon(Icons.check_box_outline_blank),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
