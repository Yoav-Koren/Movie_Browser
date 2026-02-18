import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';
import 'package:movie_browser/domain/repository/communication_repository.dart';
import 'package:movie_browser/domain/repository/storage_repository.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'views/splash_screen.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:event_bus/event_bus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var injector = CustomInjector.injector;
  onStartRepositories(injector);
  hiveOnStart();
  runApp(const MyApp());
}

Future<void> hiveOnStart() async {
  Hive.registerAdapter(MovieSearchResponseAdapter());
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //TODO Remove Later
      title: "Movie Browser",
      home: SplashScreen(),
      theme: ThemeData.dark(),
    );
  }
}
