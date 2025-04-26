import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class RootScreen extends StatefulWidget {
  final Widget child; // <<<<< Add this

  const RootScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/mood',
    '/addTask', // Center button
    '/progress',
    '/setting',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // <<< Show the current page (Home, Mood, etc.)
      bottomNavigationBar: StylishBottomBar(
  currentIndex: _selectedIndex,
  elevation: 10,
  option: AnimatedBarOptions(
    iconStyle: IconStyle.Default, // <<< Your requirement
    opacity: 0.2,
    iconSize: 28, // default icon size for normal items
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
      icon: Icon(Icons.emoji_emotions_outlined),
      selectedIcon: Icon(Icons.emoji_emotions),
      title: Text('Mood'),
    ),
    BottomBarItem(
      selectedColor: AppColors.backgroundDark,
      icon: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundDark, // optional: background circle
        ),
        child: Icon(
          Icons.add,
          size: 36, // <<< Bigger size for plus icon
          color: Colors.white,
        ),
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
    context.go(_routes[index]);
  },
)

    );
  }
}
