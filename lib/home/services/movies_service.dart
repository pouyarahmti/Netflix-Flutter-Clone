import 'package:dio/dio.dart';
import 'package:imdb_clone/common/services/env_service.dart';
import 'package:imdb_clone/home/models/movie_genre_model.dart';

import '../../common/services/dio_service.dart';
import '../../common/services/logger_service.dart';

class MoviesService {
  static final MoviesService _MoviesService = MoviesService._internal();

  late List<MovieGenre> _movieGenres;

  factory MoviesService() {
    return _MoviesService;
  }

  MoviesService._internal() {
    LoggerService().simple("Movie Service Initialized");
  }

  List<MovieGenre> get movieGenres => _movieGenres;

  Future<dynamic> getNowPlayingMovies() async {
    final apiToken = EnvironmentService().apiBearerToken;
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

  Future<dynamic> getTopRatedMovies() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/movie/top_rated",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );
    return response.data;
  }

  Future<dynamic> getPopularMovies() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/movie/popular",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );
    return response.data;
  }

  Future<dynamic> getUpcomingMovies() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/movie/upcoming",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );
    return response.data;
  }

  Future<dynamic> getMovieDetails({
    required int movieId,
  }) async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
      "/movie/$movieId",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": apiToken,
        },
      ),
      queryParameters: {
        "append_to_response": "videos,credits,images",
      },
    );
    return response.data;
  }

  Future<dynamic> getMovieGenres() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/genre/movie/list",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );

    _movieGenres = List<MovieGenre>.from(
      response.data['genres'].map(
        (element) => MovieGenre.fromJson(element),
      ),
    );
    return response.data;
  }
}
