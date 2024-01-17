class SeriesGenre {
  final int id;
  final String name;

  const SeriesGenre({
    required this.id,
    required this.name,
  });

  factory SeriesGenre.fromJson(Map<String, dynamic> json) {
    return SeriesGenre(
      id: json['id'],
      name: json['name'],
    );
  }
}
