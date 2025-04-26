import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';

class MoodCard extends StatefulWidget {
  const MoodCard({super.key});

  @override
  State<MoodCard> createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  @override
  Widget build(BuildContext context) {
    return 
     
   Card(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: AppColors.backgroundLight, // your app's light background
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Mood Emoji/Icon
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            child: Text(
              '😊', // you can dynamically change emoji based on mood
              style: const TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(width: 20),
          
          // Mood Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Yesterday's Mood",
                style: AppFonts.subheading,
              ),
              Text(
                'Happy', // You can dynamically insert the mood here
                style: AppFonts.body,
              ),
            ],
          ),
          const Spacer(),
          
          // Optional: small icon or arrow
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey[600],
          ),
        ],
      ),
    ),
  );
  }
}