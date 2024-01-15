import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';
import '../models/movie_model.dart';

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.35,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/${movieList[index].poster_path}",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Text(
                        movieList[index].title,
                        style: ThemeService()
                            .currentTheme
                            .textBoldDefault
                            .copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: movieList.take(5).length,
          ),
        ),
      ],
    );
  }
}
