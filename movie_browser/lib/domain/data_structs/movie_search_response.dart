import 'package:flutter/material.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';
import 'package:movie_browser/domain/interfaces/interface_movie_rating.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'dart:ui';

import 'package:movie_browser/domain/interfaces/interface_movie_search_response.dart';

class MovieSearchResponse implements IMovieSearchResponse {
  final String _title;
  final String _year;
  final String _releaseDate;
  final String _runtime;
  final String _rating;
  final String _genre;
  final String _director;
  final String _writers;
  final String _actors;
  final String _plot;
  final String _language;
  final String _country;
  final String _awards;
  final String _posterURL;
  final List<IMovieRatings> _ratings;
  final String _metascore;
  final String _imdbRating;
  final String _imdbVotes;
  final String _imdbID;
  final MediaType _type;
  final String _dvd;
  final String _boxOffice;
  final String _production;
  final String _websiteURL;
  Widget? _poster;
  MovieSearchResponse(
      {required String title,
      required String year,
      required String releaseDate,
      required String runtime,
      required String rating,
      required String genre,
      required String director,
      required String writers,
      required String actors,
      required String plot,
      required String language,
      required String country,
      required String awards,
      required String posterURL,
      required List<IMovieRatings> ratings,
      required String metascore,
      required String imdbRating,
      required String imdbVotes,
      required String imdbID,
      required MediaType type,
      required String dvd,
      required String boxOffice,
      required String production,
      required String websiteURL,
      Widget? poster})
      : _title = title,
        _year = year,
        _releaseDate = releaseDate,
        _runtime = runtime,
        _rating = rating,
        _genre = genre,
        _director = director,
        _writers = writers,
        _actors = actors,
        _plot = plot,
        _language = language,
        _country = country,
        _awards = awards,
        _posterURL = posterURL,
        _poster = poster,
        _ratings = ratings,
        _metascore = metascore,
        _imdbRating = imdbRating,
        _imdbVotes = imdbVotes,
        _imdbID = imdbID,
        _type = type,
        _dvd = dvd,
        _boxOffice = boxOffice,
        _production = production,
        _websiteURL = websiteURL;

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
  String get imdbRating => _imdbRating;

  @override
  String get imdbVotes => _imdbVotes;

  @override
  String get language => _language;

  @override
  String get metascore => _metascore;

  @override
  String get plot => _plot;

  @override
  Widget? get poster => _poster;

  @override
  String get posterURL => _posterURL;

  @override
  String get production => _production;

  @override
  String get rating => _rating;

  @override
  List<IMovieRatings> get ratings => _ratings;

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

  @override
  String get releaseDate => _releaseDate;

  @override
  String get runtime => _runtime;

  @override
  String get year => _year;
}
