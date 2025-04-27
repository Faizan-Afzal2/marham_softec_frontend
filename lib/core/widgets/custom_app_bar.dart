import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Color? customColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.customColor, // Default show back button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // To avoid notch areas
      child: Container(
        height: kToolbarHeight + 10, // Same as default AppBar height
        decoration: BoxDecoration(
          color: customColor ?? AppColors.backgroundLight,
        ),
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.backgroundDark),
                onPressed: () {
                  context.pop();
                },
              ),
            if (!showBackButton)
              SizedBox(width: 56), // Space where the back button would be
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.backgroundDark,
                  ),
                ),
              ),
            ),
            SizedBox(width: 56), // To balance right side (symmetry)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
