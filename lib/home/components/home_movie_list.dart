import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import 'home_movie_list_item.dart';

class HomeMovieList extends StatelessWidget {
  const HomeMovieList({super.key, required this.movieList});

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return HomeMovieListItem(
          movie: movieList[index],
        );
      },
      itemCount: movieList.take(5).length,
    );
  }
}
