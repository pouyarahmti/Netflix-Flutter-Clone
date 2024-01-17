import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/models/movie_details_model.dart';

import '../../common/services/logger_service.dart';
import '../components/movie_details_screen_banner_carousel.dart';
import '../models/movie_model.dart';
import '../services/movies_service.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  static const routeName = 'movie-details';

  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool _isLoading = false;

  late MovieDetail _movieDetail;

  @override
  void initState() {
    getMovieDetails();
    super.initState();
  }

  void getMovieDetails() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final movieDetailsResponse = await MoviesService().getMovieDetails(
        movieId: widget.movie.id,
      );
      LoggerService().info(
          title: "MOVIE DETAILAS:",
          message: movieDetailsResponse['images']['posters']);

      setState(() {
        _movieDetail = MovieDetail.fromJson(movieDetailsResponse);
      });
    } on DioException catch (e) {
      LoggerService()
          .error(title: "GET MOVIE DETAILS FAILED:", message: e.response);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: ThemeService().currentTheme.secondary,
                ),
              )
            : SingleChildScrollView(
                child: Column(children: [
                  MovieDetailsScreenBannerCarousel(
                    posters: _movieDetail.images,
                  ),
                ]),
              ),
      ),
    );
  }
}
