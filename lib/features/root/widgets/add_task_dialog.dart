import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      elevation: 16,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width *
            0.9, // Customize width as per your design
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'How would you like to add a task?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundDark,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            OptionButton(
              icon: Icons.text_fields,
              label: 'Add via Text',
              onTap: () {
                context.push('/addTask', extra: "text");
              },
            ),
            OptionButton(
              icon: Icons.mic,
              label: 'Add via Voice',
              onTap: () {
                context.push('/addTask', extra: "voice");
              },
            ),
            OptionButton(
              icon: Icons.camera_alt,
              label: 'Add via Image',
              onTap: () {
                context.push('/addTask', extra: "image");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const OptionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: AppColors.backgroundDark,
            ),
            SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.backgroundDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
