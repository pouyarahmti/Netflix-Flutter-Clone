import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/logger_service.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

class SystemService {
  static final SystemService _instance = SystemService._internal();

  factory SystemService() {
    return _instance;
  }

  SystemService._internal() {
    LoggerService().simple("System Service Initialized");
  }

  Widget bottonNavBar({required currentIndex, required Function(int) onTap}) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: ThemeService().currentTheme.secondary,
      unselectedItemColor: ThemeService().currentTheme.gray,
      backgroundColor: const Color(0xff2C2C2D),
    );
  }
}
