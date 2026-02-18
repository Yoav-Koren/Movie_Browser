// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Movie Browser';

  @override
  String get tabSearch => 'Search';

  @override
  String get tabFavorites => 'Favorites';

  @override
  String get searchHint => 'Search...';

  @override
  String get searchHistoryTitle => 'Search History';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get noSearchHistory => 'No search history';

  @override
  String get noFavorites => 'No Favorites';

  @override
  String get noResults => 'No results';

  @override
  String get imdb => 'IMDb';

  @override
  String get metascore => 'Metascore';

  @override
  String get plot => 'Plot';

  @override
  String get director => 'Director';

  @override
  String get writers => 'Writers';

  @override
  String get actors => 'Actors';

  @override
  String get awards => 'Awards';

  @override
  String get country => 'Country';

  @override
  String get language => 'Language';

  @override
  String get boxOffice => 'Box Office';

  @override
  String get production => 'Production';

  @override
  String get notAvailable => 'N/A';
}
