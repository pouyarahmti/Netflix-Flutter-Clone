import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/screens/login_screen.dart';
import '../../common/components/buttons/fill_button.dart';
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

  final List<String> _imgs = [
    "assets/images/oppenheimer.jpg",
    "assets/images/blue_eyed_samurai.png",
    "assets/images/dune_2.jpg",
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
                Expanded(
                  child: Image.asset(
                    _imgs[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _introTitles[index],
                        style: ThemeService().currentTheme.title.copyWith(
                              fontSize: 40,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          _introSubtitles[index],
                          style: ThemeService().currentTheme.subtitle.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: _screenIndex,
                        count: _introTitles.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 6,
                          dotWidth: 8,
                          spacing: 4,
                          expansionFactor: 6,
                          dotColor: ThemeService().currentTheme.gray,
                          activeDotColor: ThemeService().currentTheme.white,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      FillButton(
                        buttonText: "Next",
                        onTap: () {
                          if (index == _introTitles.length - 1) {
                            context.replaceNamed(LoginScreen.routeName);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      )
                    ],
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
