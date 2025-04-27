import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/features/addTask/view/controllers/add_task_by_text_controller.dart';
import 'package:marham_softec/features/root/controller/root_screen_controller.dart';
import 'package:marham_softec/features/root/widgets/add_task_dialog.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/planner',
    '/addTask', // Center button (No longer used for navigation)
    '/progress',
    '/setting',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller =
          Provider.of<RootScreenController>(context, listen: false);
      controller.fetchMe();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RootScreenController>(context);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: controller.isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : widget.child,
      ),
      bottomNavigationBar: StylishBottomBar(
        currentIndex: _selectedIndex,
        elevation: 10,
        option: AnimatedBarOptions(
          iconStyle: IconStyle.Default,
          opacity: 0.2,
          iconSize: 28, // Default size for normal icons
        ),
        items: [
          BottomBarItem(
            selectedColor: AppColors.backgroundDark,
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomBarItem(
            selectedColor: AppColors.backgroundDark,
            icon: Icon(Icons.edit_calendar_outlined),
            selectedIcon: Icon(Icons.edit_calendar),
            title: Text('Planner'),
          ),
          BottomBarItem(
            selectedColor: AppColors.backgroundDark,
            icon: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundDark,
              ),
              child: Icon(Icons.add,
                  size: 36, // Larger icon size
                  color: AppColors.backgroundLight),
            ),
            title: Text('Add'),
          ),
          BottomBarItem(
            selectedColor: AppColors.backgroundDark,
            icon: Icon(Icons.show_chart_outlined),
            selectedIcon: Icon(Icons.show_chart),
            title: Text('Progress'),
          ),
          BottomBarItem(
            selectedColor: AppColors.backgroundDark,
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // If the center button is clicked (index 2), show the Add Task Dialog
          if (index == 2) {
            _showAddTaskDialog(context);
          } else {
            context.go(_routes[index]);
          }
        },
      ),
    );
  }

  // Function to show the Add Task Dialog
  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(); // Custom dialog for adding tasks
      },
    );
  }
}
