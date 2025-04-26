import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundDark.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_task,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Create New Task',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.backgroundLight,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 15),

              // Subtitle
              Text(
                'Choose your preferred method',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.backgroundLight.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 25),

              // Options
              ..._buildOptions(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions(BuildContext context) {
    return [
      _buildOption(
        context,
        icon: Icons.edit_note,
        label: 'Text Input',
        color: Colors.blueAccent,
        onTap: () => context.push('/addTask', extra: "text"),
      ),
      const SizedBox(height: 15),
      _buildOption(
        context,
        icon: Icons.mic,
        label: 'Voice Note',
        color: Colors.greenAccent,
        onTap: () => context.push('/addTask', extra: "voice"),
      ),
      const SizedBox(height: 15),
      _buildOption(
        context,
        icon: Icons.image,
        label: 'Image Scan',
        color: Colors.orangeAccent,
        onTap: () => context.push('/addTask', extra: "image"),
      ),
    ];
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.backgroundLight.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: AppColors.backgroundLight,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.backgroundLight,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: AppColors.backgroundLight.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
