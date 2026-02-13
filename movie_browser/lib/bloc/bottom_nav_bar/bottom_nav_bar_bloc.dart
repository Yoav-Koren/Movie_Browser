import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/views/pages/favorites_page.dart';
import 'package:movie_browser/views/pages/search_page.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc()
      : super(BottomNavBarState(currentPage: PageRoutings.searchPageIndex)) {
    on<BottomNavBarEvent>((event, emit) {});

    on<NavigateToPageEvent>((event, emit) {
      emit(BottomNavBarState(currentPage: event.routePage));
    });
  }
}
