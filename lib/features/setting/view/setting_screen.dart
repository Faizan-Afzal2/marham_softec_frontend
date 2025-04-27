import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Theme Change
          ListTile(
            leading: Icon(Icons.brightness_6),  // Icon for theme change
            title: Text("Theme Change"),
            onTap: () {
            context.push('/themeChange');
            },
          ),
          
          // Privacy Policy
          ListTile(
            leading: Icon(Icons.lock),  // Icon for privacy policy
            title: Text("Privacy Policy"),
            onTap: () {
             context.push('/privacyPolicy');
            },
          ),
          
          // Terms & Conditions
          ListTile(
            leading: Icon(Icons.description),  // Icon for terms & conditions
            title: Text("Terms & Conditions"),
            onTap: () {
              context.push('/termsScreen');
            },
          ),
          
          // About App
          ListTile(
            leading: Icon(Icons.info),  // Icon for about app
            title: Text("About App"),
            onTap: () {
             context.push('/about');
            },
          ),
          
          // Log Out
          ListTile(
            leading: Icon(Icons.exit_to_app),  // Icon for log out
            title: Text("Log Out"),
            onTap: () {
              // Handle log out
            },
          ),
        ],
      ),
    );
  }
}

