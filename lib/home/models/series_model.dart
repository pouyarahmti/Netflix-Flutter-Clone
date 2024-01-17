import '../services/series_service.dart';
import 'series_genre_model.dart';

class Serie {
  final int id;
  final String title;
  final double vote_average;
  final int vote_count;
  final double popularity;
  final List<SeriesGenre> genres;
  final String overview;
  final String poster_path;

  const Serie({
    required this.id,
    required this.title,
    required this.vote_average,
    required this.vote_count,
    required this.popularity,
    required this.genres,
    required this.overview,
    required this.poster_path,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      id: json['id'],
      title: json['name'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      popularity: json['popularity'],
      genres: List<SeriesGenre>.from(
        json['genre_ids'].map(
          (genreId) => SeriesService()
              .seriesGenres
              .firstWhere((genre) => genre.id == genreId),
        ),
      ),
      overview: json['overview'],
      poster_path: json['poster_path'],
    );
  }
}
