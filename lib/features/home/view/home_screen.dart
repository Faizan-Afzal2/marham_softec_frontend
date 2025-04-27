import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/features/home/widget/horizontal_bar.dart';
import 'package:marham_softec/features/home/widget/mood_card.dart';
import 'package:marham_softec/features/home/widget/progress_bar.dart';
import 'package:marham_softec/features/home/widget/task_list_widget.dart';
import 'package:marham_softec/features/root/controller/root_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const List<Map<String, dynamic>> tasks = [
    {
      'category': 'Work',
      'taskName': 'Complete Task A',
      'dueDate': '2025-04-28',
      'color': 0xFFD6EAF8 // Very light blue
    },
    {
      'category': 'Personal',
      'taskName': 'Buy Groceries',
      'dueDate': '2025-04-29',
      'color': 0xFFFADBD8 // Very light pink
    },
    {
      'category': 'Work',
      'taskName': 'Attend Meeting',
      'dueDate': '2025-04-30',
      'color': 0xFFD6EAF8 // Very light blue (same as Work above)
    },
    {
      'category': 'Health',
      'taskName': 'Morning Workout',
      'dueDate': '2025-04-27',
      'color': 0xFFD5F5E3 // Very light green
    },
  ];
  static bool hasNotification = true;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RootScreenController>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("khubaib", style: AppFonts.heading)
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle notification icon tap
                          },
                          icon: Icon(
                            Icons.notifications_none,
                            size: 28,
                          ),
                        ),
                        if (HomeScreen.hasNotification)
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ProgressFloatingCard(progressPercent: 0.7),
                SizedBox(
                  height: 10,
                ),
                // MoodCard(),
                SizedBox(
                  height: 10,
                ),
                HorizontalBar(tasks: HomeScreen.tasks),
                TaskListWidget(tasks: HomeScreen.tasks)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDark,
        onPressed: () {
          context.push('/calendar');
        },
        child: const Icon(
          Icons.calendar_today,
          size: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}
