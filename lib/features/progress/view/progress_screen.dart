import 'package:flutter/material.dart';
import 'package:marham_softec/features/progress/view/daily_progress.dart';
import 'package:marham_softec/features/progress/view/monthly_progress.dart';
import 'package:marham_softec/features/progress/view/weekly_progress.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 3 tabs: Daily, Weekly, Monthly
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Progress"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Daily"),
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Daily Progress Tab
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DailyProgressGauge(progressValue: 0.75),
                ],
              ),
            ),
            // Weekly Progress Tab
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeeklyProgressChart(
                      weeklyProgress: {
                        'Mon': 0.1,
                        'Tue': 0.6,
                        'Wed': 0.4,
                        'Thu': 0.9,
                        'Fri': 0.5,
                        'Sat': 0.5,
                        'Sun': 0.95,
                      },
                    ),  WeeklyProgressChart(
                      weeklyProgress: {
                        'Mon': 0.8,
                        'Tue': 0.6,
                        'Wed': 0.9,
                        'Thu': 0.9,
                        'Fri': 0.85,
                        'Sat': 0.5,
                        'Sun': 0.75,
                      },
                    ),  WeeklyProgressChart(
                      weeklyProgress: {
                         'Mon': 0.1,
                        'Tue': 0.6,
                        'Wed': 0.4,
                        'Thu': 0.9,
                        'Fri': 0.85,
                        'Sat': 0.5,
                        'Sun': 0.75,
                      },
                    ),
                    // WeeklyProgressChart(),
                    // WeeklyProgressChart(),
                    // WeeklyProgressChart(),
                    // SizedBox(height: 16),
                    // Text("Weekly Progress", style: TextStyle(fontSize: 20)),
                    // SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            // Monthly Progress Tab
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MonthlyProgressChart(
                      monthlyData: {
                        1: 0.2,
                        5: 0.1,
                        10: 0.65,
                        15: 0.9,
                        20: 0.35,
                        25: 0.95,
                        30: 1.0
                      },
                    ),
                    MonthlyProgressChart(
                      monthlyData: {
                        1: 0.1,
                        5: 0.8,
                        10: 0.65,
                        15: 0.9,
                        20: 0.55,
                        25: 0.25,
                        30: 1.0
                      },
                    ),
                    MonthlyProgressChart(
                      monthlyData: {
                        1: 0.1,
                        5: 0.8,
                        10: 0.65,
                        15: 0.9,
                        20: 0.35,
                        25: 0.95,
                        30: 1.0
                      },
                    ),
                    // MonthlyProgressChart(),
                    // MonthlyProgressChart(),
                    // MonthlyProgressChart(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
