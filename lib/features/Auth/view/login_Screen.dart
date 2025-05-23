import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/theme/app_fonts.dart';
import 'package:marham_softec/core/widgets/app_textfeild.dart';
import 'package:marham_softec/core/widgets/border_button.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';
import 'package:marham_softec/features/Auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    // Use listen: false to avoid calling setState in initState
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text(
                    "MARHAM",
                    style: AppFonts.title,
                  ),
                  SizedBox(height: 160),
                  AppTextField(
                    controller: controller.emailController,
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
                    controller: controller.passwordController,
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock,
                    obscureText: controller.loginObscurePassword,
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
                        controller.loginObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.backgroundDark,
                      ),
                      onPressed: () {
                        controller.toggle();
                      },
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 160),
                  PrimaryButton(
                    onPressed: () {
                      controller.login(context);
                    },
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
