import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/services/theme_service.dart';
import '../../common/services/url_launcher_service.dart';

class HomeBannersCarousel extends StatefulWidget {
  const HomeBannersCarousel({
    super.key,
    required this.posters,
  });

  final List<String> posters;

  @override
  State<HomeBannersCarousel> createState() => _HomeBannersCarouselState();
}

class _HomeBannersCarouselState extends State<HomeBannersCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Flexible(
            child: CarouselSlider(
              items: widget.posters
                  .map(
                    (poster) => GestureDetector(
                      onTap: () {
                        // UrlLauncherService().launchURL(
                        //     "https://image.tmdb.org/t/p/original/$poster");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/$poster",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: widget.posters.length > 1,
                enlargeCenterPage: true,
                aspectRatio: 0.75,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSmoothIndicator(
                activeIndex: _current,
                count: widget.posters.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: MediaQuery.of(context).size.width * 0.025,
                  spacing: 4,
                  expansionFactor: 6,
                  dotColor: ThemeService().currentTheme.gray,
                  activeDotColor: ThemeService().currentTheme.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
