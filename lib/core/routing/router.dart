import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/features/Auth/model/view/login_Screen.dart';
import 'package:marham_softec/features/Auth/model/view/signup_screen.dart';
import 'package:marham_softec/features/home/view/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  // redirect: (context, state) {
  //   final isLoggedIn = LocalStorageService.instance.isLoggedIn();

  //   if (isLoggedIn && state.fullPath == '/') {
  //     return '/home'; // If logged in and trying to access login, go to home
  //   } else if (!isLoggedIn && state.fullPath == '/home') {
  //     return '/'; // If not logged in but trying to go home, force login
  //   }
  //   return null; // No redirect needed
  // },
  routes: [
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

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class LocalStorageService {
//   static final instance = LocalStorageService._();
//   LocalStorageService._();

//   bool isLoggedIn() {
//     final token = prefs.getString('userToken');
//     return token != null && token.isNotEmpty;
//   }
// }
