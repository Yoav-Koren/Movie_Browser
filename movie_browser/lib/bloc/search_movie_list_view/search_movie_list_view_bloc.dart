import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/data_structs/movie_data_simple.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';

part 'search_movie_list_view_event.dart';
part 'search_movie_list_view_state.dart';

class SearchMovieListViewBloc
    extends Bloc<SearchMovieListViewEvent, SearchMovieListViewState> {
  final EventBus _eventBus;
  late final StreamSubscription<MovieResultsEvent>
      _streamSubscriptionMovieResultsEvents;
  late final StreamSubscription<MovieNotFoundEvent>
      _streamSubscriptionMovieNotFoundEvent;

  late final StreamSubscription<ConnectionFailedEvent>
      _streamSubscriptionConnectionFailedEvent;

  SearchMovieListViewBloc(this._eventBus)
      : super(SearchResultsListViewInitial()) {
    on<SearchMovieListViewEvent>((event, emit) {});
    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    _streamSubscriptionMovieResultsEvents =
        _eventBus.on<MovieResultsEvent>().listen((event) {
      emit(MovieShowState(event.results));
    });

    _streamSubscriptionMovieNotFoundEvent =
        _eventBus.on<MovieNotFoundEvent>().listen((event) {
      emit(SearchResultsErrorState(ConstString.apiMovieNotFoundResponse));
    });

    _streamSubscriptionConnectionFailedEvent =
        _eventBus.on<ConnectionFailedEvent>().listen((event) {
      emit(SearchResultsErrorState(
          event.message ?? ConstString.connectionErrorMessageDefault));
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptionMovieResultsEvents.cancel();
    _streamSubscriptionConnectionFailedEvent.cancel();
    _streamSubscriptionMovieNotFoundEvent.cancel();

    return super.close();
  }
}
