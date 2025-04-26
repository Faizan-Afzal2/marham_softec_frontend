import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/features/Auth/model/view/login_Screen.dart';
import 'package:marham_softec/features/Auth/model/view/signup_screen.dart';
import 'package:marham_softec/features/Splash/splash_screen.dart';
import 'package:marham_softec/features/addTask/view/add_task_screen.dart';
import 'package:marham_softec/features/calender/view/calender_screen.dart';
import 'package:marham_softec/features/home/view/home_screen.dart';
import 'package:marham_softec/features/mood/view/mood_screen.dart';
import 'package:marham_softec/features/progress/view/progress_screen.dart';
import 'package:marham_softec/features/root/view/root_screen.dart';
import 'package:marham_softec/features/setting/view/setting_screen.dart';

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
          path: '/mood',
          builder: (context, state) => const MoodScreen(),
        ),
        GoRoute(
          path: '/progress',
          builder: (context, state) => const ProgressScreen(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const SettingScreen(),
        ),
      ],
    ),
  ],
);
