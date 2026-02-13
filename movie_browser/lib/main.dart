import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'views/splash_screen.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  HttpManager manager = HttpManager();
  // var response = await _manager.getRequest("1917", "db392504");
  // print(response);
  runApp(const MyApp());
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
