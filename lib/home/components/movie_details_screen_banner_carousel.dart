import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/services/theme_service.dart';
import '../../common/services/url_launcher_service.dart';
import '../models/movie_details_model.dart';

class MovieDetailsScreenBannerCarousel extends StatefulWidget {
  const MovieDetailsScreenBannerCarousel({
    super.key,
    required this.posters,
  });

  final List<MovieImage> posters;

  @override
  State<MovieDetailsScreenBannerCarousel> createState() =>
      _MovieDetailsScreenBannerCarouselState();
}

class _MovieDetailsScreenBannerCarouselState
    extends State<MovieDetailsScreenBannerCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.posters
          .map(
            (poster) => GestureDetector(
              onTap: () {},
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${poster.posterPath}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          )
          .toList(),
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: widget.posters.length > 1,
        enlargeCenterPage: true,
        aspectRatio: 0.9,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(
            () {
              _current = index;
            },
          );
        },
      ),
    );
  }
}
