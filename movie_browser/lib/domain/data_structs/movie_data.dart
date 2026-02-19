import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';

part 'movie_data.g.dart';

@HiveType(typeId: 0)
class MovieData {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String year;

  @HiveField(2)
  final String releaseDate;

  @HiveField(3)
  final String runtime;

  @HiveField(4)
  final String rating;

  @HiveField(5)
  final String genre;

  @HiveField(6)
  final String director;

  @HiveField(7)
  final String writers;

  @HiveField(8)
  final String actors;

  @HiveField(9)
  final String plot;

  @HiveField(10)
  final String language;

  @HiveField(11)
  final String country;

  @HiveField(12)
  final String awards;

  @HiveField(13)
  final String posterURL;

  @HiveField(14)
  final List<MovieRatings> ratings;

  @HiveField(15)
  final String metascore;

  @HiveField(16)
  final String imdbRating;

  @HiveField(17)
  final String imdbVotes;

  @HiveField(18)
  final String imdbID;

  @HiveField(19)
  final MediaType type;

  @HiveField(20)
  final String dvd;

  @HiveField(21)
  final String boxOffice;

  @HiveField(22)
  final String production;

  @HiveField(23)
  final String websiteURL;

  @HiveField(24)
  bool isFavorite;

  MovieData({
    required this.title,
    required this.year,
    required this.releaseDate,
    required this.runtime,
    required this.rating,
    required this.genre,
    required this.director,
    required this.writers,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.posterURL,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.websiteURL,
    required this.isFavorite,
  });
}
