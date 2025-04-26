import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Use listen: false to avoid calling setState in initState
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('HomeScreen'),
        ),
      ),
    );
  }
}
