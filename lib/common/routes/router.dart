import 'package:go_router/go_router.dart';
import 'package:imdb_clone/intro/screens/splash_screen.dart';
import 'package:imdb_clone/main.dart';

import '../../auth/screens/login_screen.dart';
import '../../intro/screens/intro_screen.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: IntroScreen.routeName,
      name: IntroScreen.routeName,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
