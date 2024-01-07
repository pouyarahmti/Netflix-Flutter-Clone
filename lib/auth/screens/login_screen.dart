import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Login",
            style: ThemeService().currentTheme.title,
          ),
        ),
      ),
    );
  }
}
