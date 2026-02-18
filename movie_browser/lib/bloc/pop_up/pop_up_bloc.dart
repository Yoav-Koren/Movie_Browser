import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
part 'pop_up_event.dart';
part 'pop_up_state.dart';

class PopUpBloc extends Bloc<PopUpEvent, PopUpState> {
  final EventBus _eventBus;
  late final StreamSubscription<MovieFullResultEvent> fullMovieResulsStream;
  PopUpBloc(this._eventBus) : super(PopUpInitial()) {
    on<PopUpEvent>((event, emit) {});
    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    fullMovieResulsStream =
        _eventBus.on<MovieFullResultEvent>().listen((event) {
      emit(ShowMovieSearchResultState(event.result));
    });
  }

  @override
  Future<void> close() {
    fullMovieResulsStream.cancel();
    return super.close();
  }
}
