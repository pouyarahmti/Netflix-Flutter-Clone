import 'package:flutter/material.dart';

import 'logger_service.dart';

class EnvironmentService {
  static final EnvironmentService _instance = EnvironmentService._internal();

  factory EnvironmentService() {
    return _instance;
  }

  EnvironmentService._internal() {
    LoggerService().simple("ENV SERVICE INITIALIZED");
  }

  // API Keys
  final String _apiKey = "9949e4a6d0fd3e8eb8aae8a68846a68e";
  final String _apiBearerToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTQ5ZTRhNmQwZmQzZThlYjhhYWU4YTY4ODQ2YTY4ZSIsInN1YiI6IjY1OWE3YmIyMWQxYmY0MDI1ZWRlNTEzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WALVgJSLT93lq_H9fWrcW9K3MnftpscuMw9sfrGV0Ns";

  // API Base URL
  final String _apiBaseUrl = "https://api.themoviedb.org/3";

  // Navigation Key
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // Getters
  String get apiKey => _apiKey;
  String get apiBearerToken => _apiBearerToken;
  String get apiBaseUrl => _apiBaseUrl;
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
