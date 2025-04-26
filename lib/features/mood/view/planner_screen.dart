import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  DateTime _selectedDate = DateTime.now();
  final List<String> _filters = ['All', 'To do', 'In Progress'];
  String _selectedFilter = 'All';
  final List<Map<String, dynamic>> _tasks = [
    {
      "id": 6,
      "title": "Grocery shopping app design",
      "description": "Market Research",
      "dueDate": "2024-05-23T10:00:00.000Z",
      "completed": true,
      "category": "Work",
      "subtasks": []
    },
    {
      "id": 7,
      "title": "Grocery shopping app design",
      "description": "Competitive Analysis",
      "dueDate": "2024-05-23T12:00:00.000Z",
      "completed": false,
      "category": "Work",
      "subtasks": []
    },
    {
      "id": 8,
      "title": "Uber Eats redesign challenge",
      "description": "Create Low-fidelity Wireframe",
      "dueDate": "2024-05-23T19:00:00.000Z",
      "completed": false,
      "category": "Personal",
      "subtasks": [
        {
          "id": 9,
          "title": "Finish project report",
          "description": "Complete the final report",
          "dueDate": "2024-06-30T17:00:00.000Z",
          "completed": false,
          "category": "Personal",
          "subtasks": []
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Today's Tasks",
              style: AppFonts.heading,
            ),
            _buildDatePicker(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: _buildFilters(),
            ),
            Expanded(
              child: _buildTaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index - 15));
          final isSelected = date.day == _selectedDate.day;
          return GestureDetector(
            onTap: () => setState(() => _selectedDate = date),
            child: Container(
              width: 60,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.backgroundDark : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.backgroundLight
                          : AppColors.backgroundDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? AppColors.backgroundLight
                          : AppColors.backgroundDark,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final filter = _filters[index];
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = filter),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                color: _selectedFilter == filter
                    ? AppColors.backgroundDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.backgroundDark),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    color: _selectedFilter == filter
                        ? AppColors.backgroundLight
                        : AppColors.backgroundDark,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return _buildTaskItem(task, 0);
      },
    );
  }

  Widget _buildTaskItem(Map<String, dynamic> task, int indentLevel) {
    final dueDate = DateTime.parse(task['dueDate']);
    return Padding(
      padding: EdgeInsets.only(left: indentLevel * 20.0),
      child: Card(
        color: AppColors.backgroundLight,
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task['description'],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: Colors.blueGrey[300],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  DateFormat('hh:mm a').format(dueDate),
                                  style: TextStyle(
                                    color: Colors.blueGrey[300],
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getCategoryColor(task['category'])
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color:
                                            _getCategoryColor(task['category']),
                                        width: 1),
                                  ),
                                  child: Text(
                                    task['category'],
                                    style: TextStyle(
                                      color:
                                          _getCategoryColor(task['category']),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (task['completed'])
                Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.customGreen,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Work':
        return Colors.blueAccent;
      case 'Personal':
        return Colors.greenAccent;
      default:
        return Colors.blueGrey;
    }
  }
}
