import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imdb_clone/common/services/logger_service.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

import '../../main.dart';

class ToastService {
  static final ToastService _instance = ToastService._internal();
  late FToast _fToast;

  factory ToastService() {
    return _instance;
  }

  ToastService._internal() {
    LoggerService().simple("TOAST SERVICE INITIALIZED");
    _fToast = FToast();
    _fToast.init(navigatorKey.currentContext!);
  }

  void showErrorToast(String message) {
    _fToast.showToast(
      child: Toast(message: message, color: ThemeService().currentTheme.danger),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      isDismissable: true,
    );
  }

  void showSuccessToast(String message) {
    _fToast.showToast(
      child:
          Toast(message: message, color: ThemeService().currentTheme.success),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      isDismissable: true,
    );
  }

  void showInfoToast(String message) {
    _fToast.showToast(
      child: Toast(message: message, color: ThemeService().currentTheme.info),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      isDismissable: true,
    );
  }

  void showWanringToast(String message) {
    _fToast.showToast(
      child:
          Toast(message: message, color: ThemeService().currentTheme.warning),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      isDismissable: true,
    );
  }
}

class Toast extends StatelessWidget {
  const Toast({super.key, required this.message, required this.color});

  final String message;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Text(
        message,
        style: ThemeService().currentTheme.textBoldDefault.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
