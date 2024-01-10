import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';
import '../components/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static const routeName = 'forget-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ForgetPasswordForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "I remembered my password! ",
                    style: ThemeService().currentTheme.textDefault.copyWith(
                          color: const Color(0xff3F3F41),
                        ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.bottom,
                        child: GestureDetector(
                          child: Text(
                            "Return",
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
