import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

import '../models/movie_model.dart';
import '../models/series_model.dart';

class AllSeriesScreen extends StatelessWidget {
  const AllSeriesScreen({super.key, required this.serieList});

  static const routeName = 'all-series';

  final List<Serie> serieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'All SERIES',
          style:
              ThemeService().currentTheme.title.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
