import 'dart:ui';

import 'package:movie_browser/consts/const_enums.dart';

abstract class IMovieSimpleSearchResponse {
  String get title;
  String get year;
  String get posterURL;
  Image? get poster;
  String get imdbID;
  MediaType get type;
}
