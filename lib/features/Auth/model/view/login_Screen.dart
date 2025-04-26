import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true; // For password eye toggle

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // TODO: Call your login API here with email and password
      print('Email: $email, Password: $password');
      context.push('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text(
                    "MARHAM",
                    style: AppFonts.title,
                  ),
                  SizedBox(height: 160),
                  AppTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.backgroundDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 160),
                  PrimaryButton(
                    onPressed: _login,
                    text: 'Login',
                  ),
                  SizedBox(height: 14),
                  BorderButton(
                    onPressed: () {
                      context.push('/signup');
                    },
                    text: 'Create an account',
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
