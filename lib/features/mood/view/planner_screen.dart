import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                color: isSelected ? Colors.blueGrey[800] : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.grey,
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
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _selectedFilter == filter
                    ? Colors.blueGrey[800]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blueGrey.shade700),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    color:
                        _selectedFilter == filter ? Colors.white : Colors.grey,
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
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _tasks.length,
      separatorBuilder: (context, index) => Divider(
        height: 24,
      ),
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
        color: Colors.blueGrey[900],
        margin: const EdgeInsets.symmetric(vertical: 4),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.blueGrey.shade800, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: task['completed'],
                    onChanged: (value) => setState(
                      () => task['completed'] = value ?? false,
                    ),
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => task['completed']
                          ? Colors.greenAccent
                          : Colors.blueGrey[800]!,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                task['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (task['completed'])
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.greenAccent, width: 1),
                                ),
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task['description'],
                          style: TextStyle(
                            color: Colors.grey[400],
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
                                    color: _getCategoryColor(task['category']),
                                    width: 1),
                              ),
                              child: Text(
                                task['category'],
                                style: TextStyle(
                                  color: _getCategoryColor(task['category']),
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
              ...(task['subtasks'] as List).map<Widget>(
                (subtask) => _buildTaskItem(subtask, indentLevel + 1),
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
