import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/features/Auth/model/view/login_Screen.dart';
import 'package:marham_softec/features/Auth/model/view/signup_screen.dart';
import 'package:marham_softec/features/home/view/home_screen.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: 'HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: 'SignUpScreen',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
