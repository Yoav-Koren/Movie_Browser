import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/views/main_scaffold.dart';
import 'package:movie_browser/views/pages/search_page.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) {});

    on<SplashScreenStartUpEvent>((event, emit) {
      //TODO ADD Loading data here like saved favs and search results
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(builder: (context) => const MainScaffold()),
        );
      });
    });
  }
}
