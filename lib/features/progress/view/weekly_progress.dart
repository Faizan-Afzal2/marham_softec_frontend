import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:marham_softec/core/theme/app_colors.dart';

class WeeklyProgressChart extends StatefulWidget {
  final Map<String, double> weeklyProgress;
  const WeeklyProgressChart({super.key, required this.weeklyProgress});

  @override
  State<WeeklyProgressChart> createState() => _WeeklyProgressChartState();
}

class _WeeklyProgressChartState extends State<WeeklyProgressChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 1.0,
            barTouchData: BarTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, response) {
                if (response?.spot?.touchedBarGroupIndex != null) {
                  setState(() {
                    touchedIndex = response!.spot!.touchedBarGroupIndex;
                  });
                }
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final day = widget.weeklyProgress.keys.elementAt(value.toInt());
                    return Text(
                      day,
                      style: const TextStyle(fontSize: 12),
                    );
                  },
                  reservedSize: 30,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                  reservedSize: 30,
                  interval: 0.2,
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: widget.weeklyProgress.entries.map((entry) {
              final index = widget.weeklyProgress.keys.toList().indexOf(entry.key);
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: entry.value,
                    color: AppColors.backgroundDark,
                    width: 20,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}