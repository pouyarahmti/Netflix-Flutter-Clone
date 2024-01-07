import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  int _screenIndex = 0;

  final List<String> _introTitles = [
    "Watch on any device",
    "Choose, select, watch",
    "Download and watch offline",
  ];

  final List<String> _introSubtitles = [
    "Stream on your phone, tablet, laptop and TV without more",
    "Smart filters will help you to find the best one among various characteristics of movies",
    "Save your data, watch offline on a plane, train, or car",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: _introTitles.length,
          controller: _pageController,
          onPageChanged: (newScreenIndex) {
            setState(() {
              _screenIndex = newScreenIndex;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  _introTitles[index],
                  style: ThemeService().currentTheme.title.copyWith(
                        fontSize: 40,
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
