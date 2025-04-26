import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true, // Default show back button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea( // To avoid notch areas
      child: Container(
        height: kToolbarHeight + 10, // Same as default AppBar height
        decoration: BoxDecoration(
          color: Colors.white,
          
        ),
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
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
                    color: Colors.black87,
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
