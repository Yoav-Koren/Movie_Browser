// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final EventBus _eventBus;
  late final StreamSubscription<SearchHistoryListUpdatedEvent>
      _streamSubscriptionSearchHistoryListUpdatedEvent;
  SearchHistoryBloc(this._eventBus) : super(SearchHistoryInitial([])) {
    on<SearchHistoryEvent>((event, emit) {});

    on<RemoveSearchEvent>((event, emit) {
      _eventBus.fire(DeleteSearchEvent(event.query));
    });

    on<ClearHistoryEvent>((event, emit) {
      _eventBus.fire(ClearSearchHistoryEvent());
    });

    on<LoadSearchHistoryEvent>((event, emit) {
      _eventBus.fire(SearchHistoryListRequestEvent());
    });
    _eventBusEventListening();
  }
  void _eventBusEventListening() {
    _streamSubscriptionSearchHistoryListUpdatedEvent =
        _eventBus.on<SearchHistoryListUpdatedEvent>().listen((event) {
      emit(LoadSearchHistoryState(event.searchHistoryList));
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptionSearchHistoryListUpdatedEvent.cancel();
    return super.close();
  }
}
