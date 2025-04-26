import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/utils/functions.dart';

class HorizontalBar extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const HorizontalBar({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("In Progress", style: AppFonts.heading,),
            SizedBox(width: 10,),
            Text('${tasks.length}')
          ],
        ),
        SizedBox(height: 10,),
        Container(
          // color: Colors.red,
          height: 120, // Adjust the height of the horizontal bar
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 190, // Width of each container
                    decoration: BoxDecoration(
                      color: Color(tasks[index]["color"]),
                  //     border: Border.all(
                  //   width: 1.0, // Border width
                  //   style: BorderStyle.solid, // Border style (solid, dashed, etc.)
                  // ),
                      borderRadius: BorderRadius.circular(16),
                      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row with category name and badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tasks[index]['category'] ?? 'Category', // Category name
                                style: AppFonts.body
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(getCategoryIcon(tasks[index]['category']))
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Task name
                          Text(
                            tasks[index]['taskName'] ?? 'Task Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          // const SizedBox(height: 8),
                          // Due date with checkbox
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tasks[index]['dueDate'] ?? '2025-04-28', // Due date
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              Checkbox(
                                value: false, // Change this to dynamic value based on task state
                                onChanged: (bool? value) {
                                  // Handle checkbox state change
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
