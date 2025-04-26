import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marham_softec/core/widgets/custom_snackbar.dart';
import 'package:marham_softec/services/auth_service.dart';
import 'package:marham_softec/services/local_storage_service.dart';

class AuthController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();

  bool loginObscurePassword = true;
  bool signUpObscurePassword = true;

  AuthService _authservice = new AuthService();

  void login(BuildContext context) async {
    print("funtion");
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      final results =
          await _authservice.logIn(email: email, password: password);
      if (results['success']) {
        // Save the access token to shared preferences
        final token = results['data']['access_token'];
        await LocalStorageService.saveString('access_token', token);
        context.go('/home');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackbar(
              title: "Success",
              message: "Account created successfully",
              icon: Icons.check_circle,
              backgroundColor: Colors.green,
            ),
          );
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackbar(
              title: "Error",
              message: results['data']['message'],
              icon: Icons.error,
              backgroundColor: Colors.red,
            ),
          );
      }
    }
    notifyListeners();
  }

  void signup(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      final results = await _authservice.signUp(
          email: email, name: email, password: password);

      if (results['success']) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackbar(
              title: "Success",
              message: "Account created successfully",
              icon: Icons.check_circle,
              backgroundColor: Colors.green,
            ),
          );
        context.pop();
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackbar(
              title: "Error",
              message: results['data']['message'],
              icon: Icons.error,
              backgroundColor: Colors.red,
            ),
          );
      }
    }
    notifyListeners();
  }

  void toggle() {
    loginObscurePassword = !loginObscurePassword;
    notifyListeners();
  }

  void signUpToggle() {
    signUpObscurePassword = !signUpObscurePassword;
    notifyListeners();
  }
}
