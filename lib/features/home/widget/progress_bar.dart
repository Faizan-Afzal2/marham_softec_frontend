import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressFloatingCard extends StatelessWidget {
  final double progressPercent;

  const ProgressFloatingCard({Key? key, required this.progressPercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align( // <<< Important
        alignment: Alignment.topCenter, // Top Center
        
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(40),
            color: AppColors.backgroundLight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% screen width
              // height: MediaQuery.of(context).size.height * 0.155,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Progress",
                        style: AppFonts.subheading,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Keep it up!",
                        style: AppFonts.body,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 90,
                        child: PrimaryButton(text: 'View Task', onPressed: (){}))
                      // BorderButton(text: 'Hello', onPressed: (){})
                    ],
                  ),
                  Spacer(),
                  
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 16.0,
                    animation: true,
                    percent: progressPercent,
                    center: Text(
                      "${(progressPercent * 100).toInt()}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.backgroundDark,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ),
        
      ),
    );
  }
}
