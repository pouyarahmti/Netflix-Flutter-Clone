import 'package:go_router/go_router.dart';
import 'package:imdb_clone/common/screens/splash_screen.dart';
import 'package:imdb_clone/common/services/env_service.dart';

final router = GoRouter(
  navigatorKey: EnvironmentService().navigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    )
  ],
);
