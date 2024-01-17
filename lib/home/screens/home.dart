import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/components/home_screen_banners_carousel.dart';
import 'package:imdb_clone/home/screens/home_screen.dart';

import '../../common/services/logger_service.dart';
import '../../common/services/system_service.dart';
import '../../profile/screens/profile_screen.dart';
import '../components/home_movie_serie_section.dart';
import '../models/movie_model.dart';
import '../services/movies_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          children: _screens,
          index: _selectedIndex,
        ),
        bottomNavigationBar: SystemService().bottonNavBar(
          currentIndex: _selectedIndex,
          onTap: (newIndex) {
            setState(
              () {
                _selectedIndex = newIndex;
              },
            );
          },
        ),
      ),
    );
  }
}
