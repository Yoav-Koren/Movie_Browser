import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';

class MovieRatings implements IMovieRatings {
  final String _source;
  final String _value;

  MovieRatings(this._source, this._value);

  @override
  String get source => _source;

  @override
  String get value => _value;
}
