import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imdb_clone/common/components/buttons/fill_button.dart';
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
                child: Column(
                  children: [
                    MovieDetailsScreenBannerCarousel(
                      posters: _movieDetail.images,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/imdb.png',
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          _movieDetail.voteAverage.toString(),
                          style: ThemeService()
                              .currentTheme
                              .textBoldDefault
                              .copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      _movieDetail.title,
                      style: ThemeService().currentTheme.title.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      _movieDetail.genres
                          .map((e) => e.name)
                          .toList()
                          .join(", "),
                      style: ThemeService().currentTheme.textDefault.copyWith(
                            color: ThemeService().currentTheme.gray,
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: FillButton(
                        buttonText: "Play",
                        onTap: () {},
                        icon: Icons.play_arrow_rounded,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _movieDetail.overview,
                        style: ThemeService().currentTheme.textDefault.copyWith(
                              color: ThemeService().currentTheme.gray,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Cast",
                          style: ThemeService()
                              .currentTheme
                              .textBoldDefault
                              .copyWith(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        itemCount: _movieDetail.cast.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      _movieDetail.cast[index].profilePath != ""
                                          ? NetworkImage(
                                              "https://image.tmdb.org/t/p/original/${_movieDetail.cast[index].profilePath}",
                                            )
                                          : null,
                                  backgroundColor:
                                      _movieDetail.cast[index].profilePath != ""
                                          ? Colors.transparent
                                          : Colors.white,
                                  child: _movieDetail.cast[index].profilePath ==
                                          ""
                                      ? Icon(
                                          Icons.person,
                                          size: 48,
                                          color:
                                              ThemeService().currentTheme.gray,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _movieDetail.cast[index].name,
                                  style: ThemeService()
                                      .currentTheme
                                      .textDefault
                                      .copyWith(
                                        color:
                                            ThemeService().currentTheme.white,
                                        fontSize: 14,
                                      ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  _movieDetail.cast[index].character,
                                  style: ThemeService()
                                      .currentTheme
                                      .textDefault
                                      .copyWith(
                                        color: ThemeService().currentTheme.gray,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
