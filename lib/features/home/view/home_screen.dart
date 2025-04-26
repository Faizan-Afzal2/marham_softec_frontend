import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/features/home/widget/progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 180.0), // Push main content a bit lower
            child: Center(
              child: Text('HomeScreen'),
            ),
          ),
          ProgressFloatingCard(progressPercent: 0.7),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDark,
        onPressed: () {
          context.push('/calendar');
        },
        child: Icon(
          Icons.calendar_today,
          size: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}
