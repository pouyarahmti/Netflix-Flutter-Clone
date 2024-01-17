import 'package:dio/dio.dart';
import 'package:imdb_clone/common/services/env_service.dart';
import 'package:imdb_clone/home/models/movie_genre_model.dart';
import 'package:imdb_clone/home/models/series_genre_model.dart';

import '../../common/services/dio_service.dart';
import '../../common/services/logger_service.dart';

class SeriesService {
  static final SeriesService _SeriesService = SeriesService._internal();

  late List<SeriesGenre> _seriesGenres;

  factory SeriesService() {
    return _SeriesService;
  }

  SeriesService._internal() {
    LoggerService().simple("Movie Service Initialized");
  }

  List<SeriesGenre> get seriesGenres => _seriesGenres;

  Future<dynamic> getTopRatedSeries() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/tv/top_rated",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );
    return response.data;
  }

  Future<dynamic> getSeriesGenre() async {
    final apiToken = EnvironmentService().apiBearerToken;
    final response = await DioService().dio.get(
          "/genre/tv/list",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": apiToken,
            },
          ),
        );

    _seriesGenres = List<SeriesGenre>.from(
      response.data['genres'].map(
        (element) => SeriesGenre.fromJson(element),
      ),
    );
    return response.data;
  }
}
