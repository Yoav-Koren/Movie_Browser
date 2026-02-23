import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_browser/bloc/localization/localization_bloc.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/repository/communication_repository.dart';
import 'package:movie_browser/domain/repository/storage_repository.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var injector = CustomInjector.injector;
  onStartRepositories(injector);
  hiveOnStart();
  runApp(BlocProvider(
    create: (context) => LocalizationBloc(),
    child: const MyApp(),
  ));
}

Future<void> hiveOnStart() async {
  Hive.registerAdapter(MovieDataAdapter());
  Hive.registerAdapter(MovieRatingsAdapter());
  Hive.registerAdapter(MediaTypeAdapter());
}

void onStartRepositories(AutoInjector autoInjector) {
  StorageRepository(autoInjector);
  CommunicationRepository(autoInjector);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale(ConstString.englishLocale),
            Locale(ConstString.polishLocale),
          ],
          debugShowCheckedModeBanner: false,
          title: ConstString.projectTitle,
          home: SplashScreen(),
          theme: ThemeData.dark(),
        );
      },
    );
  }
}
