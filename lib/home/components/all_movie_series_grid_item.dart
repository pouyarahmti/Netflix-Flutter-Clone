import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';
import '../models/movie_model.dart';
import '../models/series_model.dart';

class AllMovieSeriesGridItem extends StatelessWidget {
  const AllMovieSeriesGridItem({
    super.key,
    this.movie,
    this.serie,
    required this.onTap,
  });

  final Movie? movie;
  final Serie? serie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original/${movie != null ? movie!.poster_path : serie!.poster_path}",
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
                    movie != null ? movie!.title : serie!.title,
                    style: ThemeService().currentTheme.textBoldDefault.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    child: Text(
                      movie != null
                          ? movie!.genres.map((e) => e.name).toList().join(", ")
                          : serie!.genres
                              .map((e) => e.name)
                              .toList()
                              .join(", "),
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
