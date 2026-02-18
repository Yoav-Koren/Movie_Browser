import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';

abstract class IMovieSimpleSearchResponse {
  String get title;
  String get year;
  String get posterURL;

  String get imdbID;
  MediaType get type;
}
