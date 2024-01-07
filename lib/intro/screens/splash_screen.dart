import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_clone/common/services/shared_prefs_service.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/intro/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleStartup();
    });
  }

  void handleStartup() {
    final bool isFirstTime = SharedPreferencesService().getIsFirstTime();
    if (isFirstTime) {
      context.pushReplacementNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: ThemeService().currentTheme.title,
        ),
      ),
    );
  }
}
