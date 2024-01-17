import '../services/movies_service.dart';
import 'movie_genre_model.dart';

class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final int revenue;
  final int budget;
  final List<MovieGenre> genres;
  final List<MovieCast> cast;
  final List<MovieImage> images;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.revenue,
    required this.budget,
    required this.genres,
    required this.cast,
    required this.images,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      popularity: json['popularity'],
      revenue: json['revenue'],
      budget: json['budget'],
      cast: List<MovieCast>.from(
        json['credits']['cast'].map(
          (cast) => MovieCast.fromJson(cast),
        ),
      ),
      genres: List<MovieGenre>.from(
        json['genres'].map(
          (genre) => MovieGenre(id: genre['id'], name: genre['name']),
        ),
      ),
      images: List<MovieImage>.from(
        json['images']['posters'].map(
          (image) => MovieImage(posterPath: image['file_path']),
        ),
      ),
    );
  }
}

class MovieCast {
  final int id;
  final String name;
  final String character;
  final String? profilePath;
  final double popularity;

  MovieCast({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
    required this.popularity,
  });

  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'] ?? '',
      popularity: json['popularity'],
    );
  }
}

class MovieImage {
  final String posterPath;

  MovieImage({
    required this.posterPath,
  });

  factory MovieImage.fromJson(Map<String, dynamic> json) {
    return MovieImage(
      posterPath: json['file_path'],
    );
  }
}
