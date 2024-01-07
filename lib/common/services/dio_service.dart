import 'package:dio/dio.dart';

import 'env_service.dart';
import 'logger_service.dart';

class DioService {
  static final DioService _instance = DioService._internal();

  late final Dio _dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() {
    LoggerService().simple("DIO SERVICE INITIALIZED");
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvironmentService().apiBaseUrl,
        contentType: "application/json",
        headers: {
          "Authorization": EnvironmentService().apiBearerToken,
          "accept": "application/json",
        },
      ),
    );
  }

  Dio get dio => _dio;
}
