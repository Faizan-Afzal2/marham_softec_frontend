import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About the App")),
      body: Center(
        child: Text("This is a simple settings app."),
      ),
    );
  }
}