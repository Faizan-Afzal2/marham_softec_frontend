import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/utils/functions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

// double progressPercent;
  const TaskListWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text("Task's Category", style: AppFonts.heading),
        SizedBox(height: 20),

        // List of Tasks
        Container(
          child: ListView.builder(
            shrinkWrap: true, // important to use inside Column
            physics: NeverScrollableScrollPhysics(), // disable internal scroll
            itemCount: tasks.length, // replace with your task list length
            itemBuilder: (context, index) {
              return Container(
                // elevation: 4,
                // color: AppColors.backgroundLight,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0, // Border width
                    style:
                        BorderStyle.solid, // Border style (solid, dashed, etc.)
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Color(
                          tasks[index]["color"]), // Light background color
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    padding: EdgeInsets.all(8), // Space inside the square
                    child: Icon(getCategoryIcon(tasks[index]['category'])),
                  ),
                  title: Text(
                    tasks[index]['category'] ?? 'Category', // Category name
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  //
                  subtitle: Text(
                    '23 Tasks', // dynamically your task description
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: SizedBox(
                    width: 60, // Control width properly
                    height: 60,
                    child: Center(
                      child: CircularPercentIndicator(
                        radius: 25.0,
                        lineWidth: 5.0,
                        animation: true,
                        percent: 0.5,
                        center: Text(
                          "${(0.5 * 100).toInt()}%",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: HSLColor.fromColor(Color(tasks[index]["color"])).withLightness((HSLColor.fromColor(Color(tasks[index]["color"])).lightness - 0.2).clamp(0.0, 1.0)).toColor(),
                        backgroundColor: Color(tasks[index]["color"]),
                      ),
                    ),
                  ),

                  onTap: () {
                    // Navigate to task details or edit screen
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
