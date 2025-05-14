import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/features/Auth/view/login_Screen.dart';
import 'package:marham_softec/features/Auth/view/signup_screen.dart';
import 'package:marham_softec/features/Splash/splash_screen.dart';
import 'package:marham_softec/features/TaskDetail/view/task_detail_screen.dart';
import 'package:marham_softec/features/addTask/view/add_task_screen.dart';
import 'package:marham_softec/features/calender/view/calender_screen.dart';
import 'package:marham_softec/features/home/view/home_screen.dart';
import 'package:marham_softec/features/mood/view/planner_screen.dart';
import 'package:marham_softec/features/progress/view/progress_screen.dart';
import 'package:marham_softec/features/root/view/root_screen.dart';
import 'package:marham_softec/features/setting/view/about.dart';
import 'package:marham_softec/features/setting/view/privacy_policy.dart';
import 'package:marham_softec/features/setting/view/setting_screen.dart';
import 'package:marham_softec/features/setting/view/terms_condition.dart';
import 'package:marham_softec/features/setting/view/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/calendar', // <<< add this outside the ShellRoute
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(
      path: '/addTask',
      builder: (context, state) {
        final String data = state.extra as String;
        return AddTaskScreen(data: data);
      },
    ),
    GoRoute(
      path: '/taskDetail',
      builder: (context, state) {
        // Make sure you are correctly casting the `extra` as Map<String, dynamic>
        final Map<String, dynamic> taskData =
            state.extra as Map<String, dynamic>;
        print('Task Data received: $taskData'); // Print to verify

        // Pass the map to the TaskDetailScreen
        return TaskDetailScreen(data: taskData);
      },
    ),
    GoRoute(
      path: '/themeChange', // <<< add this outside the ShellRoute
      builder: (context, state) => const ThemeChangeScreen(),
    ),
    GoRoute(
      path: '/privacyPolicy', // <<< add this outside the ShellRoute
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: '/termsScreen', // <<< add this outside the ShellRoute
      builder: (context, state) => const TermsScreen(),
    ),
    GoRoute(
      path: '/about', // <<< add this outside the ShellRoute
      builder: (context, state) => const AboutAppScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return RootScreen(
          child: child,
        ); // Always show nav bar
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/planner',
          builder: (context, state) => const PlannerScreen(),
        ),
        GoRoute(
          path: '/progress',
          builder: (context, state) => ProgressScreen(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => SettingScreen(),
        ),
      ],
    ),
  ],
);
