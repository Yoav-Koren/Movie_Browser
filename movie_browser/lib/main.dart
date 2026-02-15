import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';
import 'package:movie_browser/domain/repository/communication_repository.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'views/splash_screen.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:event_bus/event_bus.dart';

Future<void> main() async {
  var injector = CustomInjector.injector;
  onStartRepositories(injector);
  runApp(const MyApp());
}

void onStartRepositories(AutoInjector autoInjector) {
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
