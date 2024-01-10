import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';
import '../components/forget_password_form.dart';
import '../components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SignupForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Do you already have an account? ",
                    style: ThemeService().currentTheme.textDefault.copyWith(
                          color: const Color(0xff3F3F41),
                        ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.bottom,
                        child: GestureDetector(
                          child: Text(
                            "Login",
                            style: ThemeService()
                                .currentTheme
                                .textBoldDefault
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
