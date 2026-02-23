
import 'package:movie_browser/consts/hive_enums/media_type.dart';

abstract class IMovieDataSimple {
  String get title;
  String get year;
  String get posterURL;

  String get imdbID;
  MediaType get type;
}
