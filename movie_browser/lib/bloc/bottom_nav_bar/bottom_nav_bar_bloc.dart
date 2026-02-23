import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  final EventBus _eventBus;
  BottomNavBarBloc(this._eventBus)
      : super(BottomNavBarState(currentPage: PageRoutings.searchPageIndex)) {
    on<BottomNavBarEvent>((event, emit) {});

    on<NavigateToPageEvent>((event, emit) {
      if (event.routePage == PageRoutings.favoritePageIndex) {
        _eventBus.fire(MovieFavoriteListRequestEvent());
      }
      emit(BottomNavBarState(currentPage: event.routePage));
    });
  }
}
