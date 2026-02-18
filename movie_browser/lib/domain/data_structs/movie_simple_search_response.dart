import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/interfaces/interface_movie_simple_search_response.dart';

class MovieSimpleSearchResponse implements IMovieSimpleSearchResponse {
  final String _title;
  final String _year;
  final String _imdbID;
  final MediaType _mediaType;
  final String _posterURL;

  MovieSimpleSearchResponse({
    required String title,
    required String year,
    required String imdbID,
    required MediaType mediaType,
    required String posterURL,
  })  : _title = title,
        _year = year,
        _imdbID = imdbID,
        _mediaType = mediaType,
        _posterURL = posterURL;

  @override
  String get imdbID => _imdbID;

  @override
  String get posterURL => _posterURL;

  @override
  String get title => _title;

  @override
  MediaType get type => _mediaType;

  @override
  String get year => _year;
}
