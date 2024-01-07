import 'package:go_router/go_router.dart';
import 'package:imdb_clone/intro/screens/splash_screen.dart';
import 'package:imdb_clone/common/services/env_service.dart';

import '../../intro/screens/intro_screen.dart';

final router = GoRouter(
  navigatorKey: EnvironmentService().navigatorKey,
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
    )
  ],
);
