import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/components/home_screen_banners_carousel.dart';

import '../../common/services/logger_service.dart';
import '../../common/services/system_service.dart';
import '../components/home_movie_serie_section.dart';
import '../models/movie_model.dart';
import '../models/series_model.dart';
import '../services/movies_service.dart';
import '../services/series_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  final List<Movie> _nowPlayingMovies = [];
  final List<Movie> _popularMovies = [];
  final List<Movie> _topRatedMovies = [];
  final List<Movie> _upcomingMovies = [];
  final List<Serie> _topRatedSeries = [];

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  void getMovies() async {
    try {
      setState(() {
        _isLoading = true;
        _nowPlayingMovies.clear();
        _popularMovies.clear();
        _topRatedMovies.clear();
        _upcomingMovies.clear();
        _topRatedSeries.clear();
      });
      await MoviesService().getMovieGenres();
      await SeriesService().getSeriesGenre();
      Future.wait([
        getNowPlayingMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
        getUpcomingMovies(),
        getTopRatedSeries(),
      ]);
    } on DioException catch (e) {
      LoggerService().error(title: "GET MOVIES FAILED:", message: e.response);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> getPopularMovies() async {
    final getPopularMoviesResponse = await MoviesService().getPopularMovies();

    LoggerService()
        .simple("GET POPULAR MOVIES SUCCESSFUL: $getPopularMoviesResponse");

    final popularMovies = List<Movie>.from(
      getPopularMoviesResponse['results'].map(
        (element) => Movie.fromJson(
          element,
        ),
      ),
    );

    setState(() {
      _popularMovies.addAll(popularMovies);
    });
  }

  Future<void> getNowPlayingMovies() async {
    final getNowPlayingMoviesResponse =
        await MoviesService().getNowPlayingMovies();

    LoggerService().simple(
        "GET NOW PLAYING MOVIES SUCCESSFUL: $getNowPlayingMoviesResponse");

    final nowPlayingMovies = List<Movie>.from(
      getNowPlayingMoviesResponse['results'].map(
        (element) => Movie.fromJson(
          element,
        ),
      ),
    );

    setState(() {
      _nowPlayingMovies.addAll(nowPlayingMovies);
    });
  }

  Future<void> getTopRatedMovies() async {
    final getTopRatedMoviesResponse = await MoviesService().getTopRatedMovies();

    LoggerService()
        .simple("GET TOP RATED MOVIES SUCCESSFUL: $getTopRatedMoviesResponse");

    final topRatedMovies = List<Movie>.from(
      getTopRatedMoviesResponse['results'].map(
        (element) => Movie.fromJson(
          element,
        ),
      ),
    );

    setState(() {
      _topRatedMovies.addAll(topRatedMovies);
    });
  }

  Future<void> getUpcomingMovies() async {
    final getUpcomingMoviesResponse = await MoviesService().getUpcomingMovies();

    LoggerService()
        .simple("GET UPCOMING MOVIES SUCCESSFUL: $getUpcomingMoviesResponse");

    final upcomingMovies = List<Movie>.from(
      getUpcomingMoviesResponse['results'].map(
        (element) => Movie.fromJson(
          element,
        ),
      ),
    );

    setState(() {
      _upcomingMovies.addAll(upcomingMovies);
    });
  }

  Future<void> getTopRatedSeries() async {
    final getTopRatedSeriesResponse = await SeriesService().getTopRatedSeries();

    LoggerService()
        .simple("GET TOP RATED SERIES SUCCESSFUL: $getTopRatedSeriesResponse");

    final topRatedSeries = List<Serie>.from(
      getTopRatedSeriesResponse['results'].map(
        (element) => Serie.fromJson(
          element,
        ),
      ),
    );

    setState(() {
      _topRatedSeries.addAll(topRatedSeries);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => getMovies(),
      color: ThemeService().currentTheme.secondary,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  HomeBannersCarousel(
                    posters:
                        _nowPlayingMovies.map((e) => e.poster_path).toList(),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  HomeMovieSerieSection(
                    sectionTitle: "Popular",
                    movieList: _popularMovies,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeMovieSerieSection(
                    sectionTitle: "Top Rated",
                    movieList: _topRatedMovies,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeMovieSerieSection(
                    sectionTitle: "Top Series",
                    seriesList: _topRatedSeries,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeMovieSerieSection(
                    sectionTitle: "Coming Soon",
                    movieList: _upcomingMovies,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
