import 'package:flutter/material.dart';

class ThemeChangeScreen extends StatelessWidget {
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Theme")),
      body: Center(
        child: Text("Here you can change the theme of the app."),
      ),
    );
  }
}