import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'logger_service.dart';

class UrlLauncherService {
  static final UrlLauncherService _instance = UrlLauncherService._internal();

  factory UrlLauncherService() {
    return _instance;
  }

  UrlLauncherService._internal() {
    LoggerService().simple("URL LAUNCHER SERVICE INITIALIZED");
  }

  // LAUNCH URL
  Future<void> launchURL(String? link) async {
    if (link == null || link == "") return;
    if (!link.contains('//')) {
      link = "https://$link";
    }
    try {
      Uri uri = Uri.parse(link);
      _launchUrl(uri, forceWebView: Platform.isAndroid);
    } catch (e) {
      LoggerService().error(
        title: "LAUNCH URL SERVICE - LAUNCH URL",
        message: e.toString(),
      );
    }
  }

  void _launchUrl(Uri url, {bool forceWebView = false}) async {
    await launchUrl(
      url,
      mode: forceWebView ? LaunchMode.inAppWebView : LaunchMode.platformDefault,
      webViewConfiguration: const WebViewConfiguration(
        enableDomStorage: true,
        enableJavaScript: true,
      ),
    );
  }

  // OPEN EMAIL
  Future<bool> openEmail({required String address}) async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: address,
    );
    try {
      return launchUrlString('$email');
    } catch (e) {
      LoggerService()
          .error(title: "LAUNCH SERVICE - OPEN EMAIL", message: e.toString());
      return false;
    }
  }

  // CALL NUMBER
  Future<void> callNumber(String? phone) async {
    if (phone == null || phone == "") return;
    try {
      String url = 'tel:${phone.trim().replaceAll(RegExp(" "), "")}';
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {
      LoggerService().error(
        title: "LAUNCH SERVICE - CALL PHONE",
        message: e.toString(),
      );
    }
  }
}
