import 'package:flutter/material.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              Spacer(),
              PrimaryButton(
                onPressed: () {},
                text: 'Login',
              )
            ],
          ),
        ),
      ),
    );
  }
}
