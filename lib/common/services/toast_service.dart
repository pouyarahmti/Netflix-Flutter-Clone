import 'package:imdb_clone/common/services/logger_service.dart';

class ToastService {
  static final ToastService _instance = ToastService._internal();

  factory ToastService() {
    return _instance;
  }

  ToastService._internal() {
    LoggerService().simple("TOAST SERVICE INITIALIZED");
  }
}
