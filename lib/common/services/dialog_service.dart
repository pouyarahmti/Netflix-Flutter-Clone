import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../components/buttons/fill_button.dart';
import 'logger_service.dart';
import 'theme_service.dart';

class DialogsService {
  static final DialogsService _instance = DialogsService._internal();

  factory DialogsService() {
    return _instance;
  }

  DialogsService._internal() {
    LoggerService().simple("Dialogs Service Initialized");
  }

  void showAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onPressed,
    // required int quizId,
  }) async {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.65),
      barrierDismissible: true,
      builder: (BuildContext context) => BackdropFilter(
        blendMode: BlendMode.srcOver,
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ThemeService().currentTheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(title, style: ThemeService().currentTheme.title),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        message,
                        style: ThemeService().currentTheme.subtitle,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      FillButton(
                        buttonText: buttonText,
                        onTap: onPressed,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          "Cancel",
                          style: ThemeService()
                              .currentTheme
                              .textDefault
                              .copyWith(
                                  color: ThemeService().currentTheme.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
