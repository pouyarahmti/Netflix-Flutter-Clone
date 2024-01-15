import 'package:dio/dio.dart';
import 'package:imdb_clone/common/services/env_service.dart';

import '../../common/services/dio_service.dart';
import '../../common/services/logger_service.dart';

class MoviesService {
  static final MoviesService _MoviesService = MoviesService._internal();

  factory MoviesService() {
    return _MoviesService;
  }

  MoviesService._internal() {
    LoggerService().simple("Home Service Initialized");
  }

  Future<dynamic> getNowPlayingMovies() async {
    final apiToken = EnvironmentService().apiBearerToken;
    LoggerService().simple("API TOKEN: $apiToken");
    final response = await DioService().dio.get(
          "/movie/now_playing",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );
    return response.data;
  }
}
