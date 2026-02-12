import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'dart:ui';

import 'package:movie_browser/domain/interfaces/interface_movie_search_response.dart';

class MovieSearchResponse implements IMovieSearchResponse {
  final String _title;
  final DateTime _releaseDate;
  final Rating _rating;
  final String _genre;
  final String _director;
  final String _writers;
  final String _actors;
  final String _plot;
  final String _language;
  final String _country;
  final String _awards;
  final String _posterURL;
  final Image _poster;
  final List<IMovieRatings> _ratings;
  final int _metascore;
  final double _imdbRating;
  final int _imdbVotes;
  final String _imdbID;
  final MediaType _type;
  final String _dvd;
  final String _boxOffice;
  final String _production;
  final String _websiteURL;

  MovieSearchResponse(
      this._title,
      this._releaseDate,
      this._rating,
      this._genre,
      this._director,
      this._writers,
      this._actors,
      this._plot,
      this._language,
      this._country,
      this._awards,
      this._posterURL,
      this._poster,
      this._ratings,
      this._metascore,
      this._imdbRating,
      this._imdbVotes,
      this._imdbID,
      this._type,
      this._dvd,
      this._boxOffice,
      this._production,
      this._websiteURL);

  @override
  String get actors => _actors;

  @override
  String get awards => _awards;

  @override
  String get boxOffice => _boxOffice;

  @override
  String get country => _country;

  @override
  String get director => _director;

  @override
  String get dvd => _dvd;

  @override
  String get imdbID => _imdbID;

  @override
  double get imdbRating => _imdbRating;

  @override
  int get imdbVotes => _imdbVotes;

  @override
  String get language => _language;

  @override
  int get metascore => _metascore;

  @override
  String get plot => _plot;

  @override
  Image get poster => _poster;

  @override
  String get posterURL => _posterURL;

  @override
  String get production => _production;

  @override
  Rating get rating => _rating;

  @override
  List<IMovieRatings> get ratings => _ratings;

  @override
  DateTime get releaseDate => _releaseDate;

  @override
  String get genre => _genre;

  @override
  String get title => _title;

  @override
  MediaType get type => _type;

  @override
  String get websiteURL => _websiteURL;

  @override
  String get writers => _writers;
}
