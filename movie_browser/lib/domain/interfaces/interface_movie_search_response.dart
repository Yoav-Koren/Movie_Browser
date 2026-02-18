import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';

abstract class IMovieSearchResponse {
  String get title;
  String get year;
  String get releaseDate;
  String get runtime;
  String get rating;
  String get genre;
  String get director;
  String get writers;
  String get actors;
  String get plot;
  String get language;
  String get country;
  String get awards;
  String get posterURL;
  Widget? get poster;
  List<IMovieRatings> get ratings;
  String get metascore;
  String get imdbRating;
  String get imdbVotes;
  String get imdbID;
  MediaType get type;
  String get dvd;
  String get boxOffice;
  String get production;
  String get websiteURL;
}
