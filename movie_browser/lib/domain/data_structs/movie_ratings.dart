import 'package:hive/hive.dart';

part 'movie_ratings.g.dart';

@HiveType(typeId: 1)
class MovieRatings {
  @HiveField(0)
  final String source;

  @HiveField(1)
  final String value;

  MovieRatings({
    required this.source,
    required this.value,
  });
}
