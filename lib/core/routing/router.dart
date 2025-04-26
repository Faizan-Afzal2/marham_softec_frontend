import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/features/Auth/model/view/login_Screen.dart';
import 'package:marham_softec/features/Auth/model/view/signup_screen.dart';
import 'package:marham_softec/features/Splash/splash_screen.dart';
import 'package:marham_softec/features/home/view/home_screen.dart';

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
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
