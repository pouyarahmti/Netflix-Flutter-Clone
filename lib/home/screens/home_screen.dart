import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              "HOME",
              style: ThemeService().currentTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}
