import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/views/widgets/movie_details_widget.dart';

part 'movie_card_event.dart';
part 'movie_card_state.dart';

class MovieCardBloc extends Bloc<MovieCardEvent, MovieCardState> {
  final EventBus _eventBus;
  late final StreamSubscription<MovieFullResultEvents> fullMovieResulsStream;
  MovieCardBloc(this._eventBus) : super(MovieCardInitial()) {
    on<MovieCardEvent>((event, emit) {});

    on<MovieCardClickedEvent>((event, emit) {
      _eventBus.fire(SearchByTitleEvent(event.title));
    });
    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    fullMovieResulsStream =
        _eventBus.on<MovieFullResultEvents>().listen((event) {
      emit(ShowMovieSearchResultState(event.result));
    });
  }

  @override
  Future<void> close() {
    fullMovieResulsStream.cancel();
    return super.close();
  }
}
