import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
import 'package:movie_browser/views/pages/favorites_page.dart';
import 'package:movie_browser/views/pages/search_page.dart';

import '../../domain/data_structs/movie_data.dart';

part 'favorite_button_event.dart';
part 'favorite_button_state.dart';

class FavoriteButtonBloc
    extends Bloc<FavoriteButtonEvent, FavoriteButtonState> {
  final EventBus _eventBus;
  bool isFavorite;
  FavoriteButtonBloc(this._eventBus, this.isFavorite)
      : super(FavoriteButtonInitial(isFavorite)) {
    on<FavoriteButtonEvent>((event, emit) {});

    on<MovieFavoriteButtonClickedEvent>((event, emit) {
      isFavorite = true;
      event.movieData.isFavorite = true;
      emit(FavoriteButtonInitial(isFavorite));
      _eventBus.fire(SaveToFavoritesEvent(event.movieData));
    });

    on<MovieUnFavoriteButtonClickedEvent>((event, emit) {
      isFavorite = false;

      _eventBus.fire(DeleteFromFavoritesEvent(event.title));
      emit(FavoriteButtonInitial(isFavorite));
    });
  }
}
