import 'package:flutter/material.dart';

import '../models/series_model.dart';
import 'home_series_list_item.dart';

class HomeSeriesList extends StatelessWidget {
  const HomeSeriesList({super.key, required this.serieList});

  final List<Serie> serieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return HomeSeriesListItem(
          serie: serieList[index],
        );
      },
      itemCount: serieList.take(5).length,
    );
  }
}
