import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../models/series_model.dart';
import 'all_movie_series_grid_item.dart';
import 'home_movie_list_item.dart';
import 'home_series_list_item.dart';

class AllMovieSeriesGrid extends StatelessWidget {
  const AllMovieSeriesGrid({
    super.key,
    this.movieList = const [],
    this.serieList = const [],
    required this.scrollController,
  });

  final List<Movie> movieList;
  final List<Serie> serieList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: movieList.isNotEmpty ? movieList.length : serieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        if (movieList.isNotEmpty) {
          return AllMovieSeriesGridItem(movie: movieList[index]);
        } else {
          return AllMovieSeriesGridItem(serie: serieList[index]);
        }
      },
    );
  }
}
