import 'dart:ui';

import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';

abstract class IMovieSearchResponse {
  String get title;
  DateTime get releaseDate;
  Rating get rating;
  String get genre;
  String get director;
  String get writers;
  String get actors;
  String get plot;
  String get language;
  String get country;
  String get awards;
  String get posterURL;
  Image get poster;
  List<IMovieRatings> get ratings;
  int get metascore;
  double get imdbRating;
  int get imdbVotes;
  String get imdbID;
  MediaType get type;
  String get dvd;
  String get boxOffice;
  String get production;
  String get websiteURL;
}
