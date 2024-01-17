import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/services/theme_service.dart';
import '../models/movie_model.dart';
import '../screens/movie_details_screen.dart';

class HomeMovieListItem extends StatelessWidget {
  const HomeMovieListItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          MovieDetailsScreen.routeName,
          extra: movie,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original/${movie.poster_path}",
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          color: ThemeService().currentTheme.secondary)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: ThemeService().currentTheme.textBoldDefault.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      movie.genres.map((e) => e.name).toList().join(", "),
                      style: ThemeService().currentTheme.textDefault.copyWith(
                            fontSize: 10,
                            color: ThemeService().currentTheme.gray,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
