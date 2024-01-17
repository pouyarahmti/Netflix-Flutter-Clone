import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

import '../models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  static const routeName = 'movie-details';

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          'MOVIE DETAILS',
          style: ThemeService().currentTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
