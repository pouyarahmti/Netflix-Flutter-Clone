class Movie {
  final int id;
  final String title;
  final String release_date;
  final double vote_average;
  final int vote_count;
  final double popularity;
  final List<int> genre_ids;
  final String overview;
  final String poster_path;

  const Movie({
    required this.id,
    required this.title,
    required this.release_date,
    required this.vote_average,
    required this.vote_count,
    required this.popularity,
    required this.genre_ids,
    required this.overview,
    required this.poster_path,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      popularity: json['popularity'],
      genre_ids: List<int>.from(json['genre_ids']),
      overview: json['overview'],
      poster_path: json['poster_path'],
    );
  }
}
