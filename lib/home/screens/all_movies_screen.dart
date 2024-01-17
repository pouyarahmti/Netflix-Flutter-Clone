import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/logger_service.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/components/all_movie_series_grid.dart';

import '../models/movie_model.dart';

class AllMoviesScreen extends StatefulWidget {
  const AllMoviesScreen({super.key, required this.movieList});

  static const routeName = 'all-movies';

  final List<Movie> movieList;

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  late final ScrollController _gridScrollController;

  bool _isLoading = false;

  @override
  void initState() {
    _gridScrollController = ScrollController();
    _gridScrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_gridScrollController.position.pixels ==
        _gridScrollController.position.maxScrollExtent) {
      getData();
    }
  }

  Future<void> getData() async {
    LoggerService().simple("GET MORE DATA");
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'All Movies',
                    style: ThemeService()
                        .currentTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: AllMovieSeriesGrid(
                  movieList: widget.movieList,
                  scrollController: _gridScrollController,
                ),
              ),
              if (_isLoading)
                Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CircularProgressIndicator(
                      color: ThemeService().currentTheme.secondary,
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
