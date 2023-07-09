class FavouriteMovieMode {
  final String? id;
  final String? tmdb_movieId;
  final String original_title;
  final String title;
  final String overview;
  final String release_date;
  final String poster_path;

  FavouriteMovieMode({
    required this.id,
    required this.original_title,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.poster_path,
    required this.tmdb_movieId,
  });

  factory FavouriteMovieMode.fromJson(Map<String, dynamic> json) {
    return FavouriteMovieMode(
      tmdb_movieId: json['tmdb_movieId,'],
      id: json['id'],
      original_title: json['original_title'] ?? 'Not Available',
      title: json['title'] ?? 'Not Available',
      overview: json['overview'] ?? 'Not Available',
      release_date: json['release_date'] ?? 'Not Available',
      poster_path: json['poster_path'] ??
          'https://image.tmdb.org/t/p/originalhttps://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-1932.jpg?w=2000',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'original_title': original_title,
        'title': title,
        'overview': overview,
        'release_date': release_date,
        'poster_path': poster_path,
      };
}
