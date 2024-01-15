import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/components/home_screen_banners_carousel.dart';

import '../../common/services/logger_service.dart';
import '../components/home_movie_section.dart';
import '../models/movie_model.dart';
import '../services/movies_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  final List<Movie> _nowPlayingMovies = [];

  @override
  void initState() {
    getNowPlayingMovies();
    super.initState();
  }

  void getNowPlayingMovies() async {
    try {
      setState(() {
        _isLoading = true;
      });

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
    } on DioException catch (e) {
      LoggerService()
          .error(title: "GET NOW PLAYING MOVIES FAILED:", message: e.response);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: ThemeService().currentTheme.secondary,
              ))
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomScrollView(
                    slivers: [
                      SliverList.list(
                        children: [
                          HomeBannersCarousel(
                            posters: _nowPlayingMovies
                                .map((e) => e.poster_path)
                                .toList(),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          HomeMovieSection(
                            sectionTitle: "Popular",
                            movieList: _nowPlayingMovies,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeMovieSection(
                            sectionTitle: "New Releases",
                            movieList: _nowPlayingMovies,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeMovieSection(
                            sectionTitle: "Top Rated",
                            movieList: _nowPlayingMovies,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeMovieSection(
                            sectionTitle: "Top Series",
                            movieList: _nowPlayingMovies,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeMovieSection(
                            sectionTitle: "Coming Soon",
                            movieList: _nowPlayingMovies,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
