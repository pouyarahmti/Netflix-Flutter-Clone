import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imdb_clone/common/services/shared_prefs_service.dart';
import 'package:imdb_clone/common/services/url_launcher_service.dart';

import 'common/routes/router.dart';
import 'common/services/dio_service.dart';
import 'common/services/env_service.dart';
import 'common/services/logger_service.dart';
import 'common/services/theme_service.dart';
import 'home/services/movies_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferencesService();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initServices();
    super.initState();
  }

  void initServices() {
    LoggerService();
    EnvironmentService();
    DioService();
    UrlLauncherService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'IMDB Clone',
      builder: FToastBuilder(),
      theme: ThemeService().getThemeData(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    );
  }
}
