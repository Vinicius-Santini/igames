class Game {
  final int id;
  final String? slug;
  final String name;
  final String? released;
  final bool? tba;
  final String? backgroundImage;
  final Object? esrbRating;
  final double? rating;
  final int? ratingsCount;
  final int? metacritic;
  final int? playtime;
  final List<Genre>? genres;

  Game({
    required this.id,
    this.slug,
    required this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.esrbRating,
    this.rating,
    this.ratingsCount,
    this.metacritic,
    this.playtime,
    this.genres,
  });

  static Game fromJson(Map<String, dynamic> json) => Game(
        id: json["id"] as int,
        slug: json["slug"] as String,
        name: json["name"] as String,
        released: json["released"] as String? ?? '',
        tba: json["tba"] as bool,
        backgroundImage: json["background_image"] as String? ?? '',
        esrbRating: json["esrb_rating"] as Object?,
        rating: json["rating"] as double,
        ratingsCount: json["ratings_count"] as int,
        metacritic: json["metacritic"] as int?,
        playtime: json["playtime"] as int,
        genres: (json["genres"] as List<dynamic>)
            .map((item) => Genre.fromJson(item))
            .toList(),
      );
}

class Genre {
  final int id;
  final String name;
  final String slug;

  Genre({required this.id, required this.name, required this.slug});

  static Genre fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] as int,
        name: json["name"] as String,
        slug: json["slug"] as String,
      );
}
