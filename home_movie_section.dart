import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';
import 'package:imdb_clone/home/components/home_movie_list.dart';
import 'package:imdb_clone/home/models/movie_model.dart';

class HomeMovieSection extends StatelessWidget {
  const HomeMovieSection({
    super.key,
    required this.sectionTitle,
    required this.movieList,
  });

  final String sectionTitle;
  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              sectionTitle,
              style: ThemeService().currentTheme.title.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              "See all",
              style: ThemeService().currentTheme.textDefault.copyWith(
                    color: ThemeService().currentTheme.gray,
                  ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: HomeMovieList(
            movieList: movieList,
          ),
        ),
      ],
    );
  }
}
