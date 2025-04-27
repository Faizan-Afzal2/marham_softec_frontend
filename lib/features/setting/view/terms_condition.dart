import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms & Conditions")),
      body: Center(
        child: Text("Here are the terms and conditions."),
      ),
    );
  }
}