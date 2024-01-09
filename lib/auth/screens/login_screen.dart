import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imdb_clone/common/services/url_launcher_service.dart';

import '../../common/services/theme_service.dart';
import '../components/login_form.dart';
import '../components/login_icons_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginForm(),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By clicking on 'login' button, you accept ",
                      style: const TextStyle(
                        color: Color(0xff3F3F41),
                      ),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            child: Text(
                              "Privacy Policy",
                              style: ThemeService()
                                  .currentTheme
                                  .textBoldDefault
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                            ),
                            onTap: () async {
                              await UrlLauncherService()
                                  .launchURL("https://google.com");
                            },
                          ),
                        ),
                        const TextSpan(
                          text: " rules of our company. ",
                          style: TextStyle(
                            color: Color(0xff3F3F41),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const LoginIconsContainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: ThemeService().currentTheme.textDefault.copyWith(
                          color: const Color(0xff3F3F41),
                        ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.bottom,
                        child: GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: ThemeService()
                                .currentTheme
                                .textBoldDefault
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                          ),
                          onTap: () {},
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
