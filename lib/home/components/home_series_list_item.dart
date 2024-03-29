import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';
import '../models/movie_model.dart';
import '../models/series_model.dart';

class HomeSeriesListItem extends StatelessWidget {
  const HomeSeriesListItem({super.key, required this.serie});

  final Serie serie;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "https://image.tmdb.org/t/p/original/${serie.poster_path}",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ThemeService().currentTheme.secondary,
                  ),
                ),
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
                  serie.title,
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
                    serie.genres.map((e) => e.name).toList().join(", "),
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
    );
  }
}
