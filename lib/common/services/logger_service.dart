import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  late Logger _logger;

  static final LoggerService _instance = LoggerService._internal();

  factory LoggerService() {
    return _instance;
  }

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 4, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messagess
        printEmojis: false, // Print an emoji for each log message
        printTime: true, // Should each log print contain a timestamp
      ),
    );
    simple("LOGGER SERVICE INITIALIZED");
  }

  String wrapText(String text) {
    return "#### $text ####";
  }

  String wrapMessage(dynamic message) {
    return "Message value:\n$message";
  }

  void easy(dynamic message) {
    if (kDebugMode) {
      print(message);
    }
  }

  void simple(String message) {
    DateTime now = DateTime.now();
    if (kDebugMode) {
      print("${now.toLocal().toString()} ---> ${message.toUpperCase()}");
    }
  }

  void debug({required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.d(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }

  void verbose(
      {required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.t(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }

  void info({required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.i(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }

  void warning(
      {required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.w(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }

  void error({required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.e(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }

  void critical(
      {required String title, dynamic message, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger.f(
        wrapMessage(message),
        error: wrapText(title),
        stackTrace: stackTrace,
      );
    }
  }
}
