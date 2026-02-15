import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';

class MovieRatings implements IMovieRatings {
  final String _source;
  final String _value;

  MovieRatings({required String source, required String value})
      : _source = source,
        _value = value;

  @override
  String get source => _source;

  @override
  String get value => _value;
}
