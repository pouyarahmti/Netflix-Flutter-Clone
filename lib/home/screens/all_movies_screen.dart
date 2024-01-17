import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

import '../models/movie_model.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({super.key, required this.movieList});

  static const routeName = 'all-movies';

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'All Movies',
          style:
              ThemeService().currentTheme.title.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
