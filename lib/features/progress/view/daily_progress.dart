import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:marham_softec/core/theme/app_colors.dart';

class DailyProgressGauge extends StatelessWidget {
  final double progressValue; // Should be between 0.0 and 1.0
  const DailyProgressGauge({super.key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                startDegreeOffset: -90,
                sections: [
                  PieChartSectionData(
                    value: progressValue * 100,
                    color: AppColors.backgroundDark,
                    radius: 25,
                    title: '',
                  ),
                  PieChartSectionData(
                    value: (1 - progressValue) * 100,
                    color: Colors.grey[200],
                    radius: 25,
                    title: '',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(progressValue * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundDark,
                  ),
                ),
                const Text(
                  'Daily Goal',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}