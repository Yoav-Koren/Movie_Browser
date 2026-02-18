import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_simple_search_response.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';

part 'favorite_movie_list_view_event.dart';
part 'favorite_movie_list_view_state.dart';

class FavoriteMovieListViewBloc
    extends Bloc<FavoriteMovieListViewEvent, FavoriteMovieListViewState> {
  final EventBus _eventBus;
  late final StreamSubscription<MovieSearchResultFavoriteListUpdatedEvent>
      _streamSubscriptionMovieSearchResultFavoriteListUpdatedEvent;
  FavoriteMovieListViewBloc(this._eventBus)
      : super(FavoriteMovieListViewInitial()) {
    on<FavoriteMovieListViewEvent>((event, emit) {});

    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    _streamSubscriptionMovieSearchResultFavoriteListUpdatedEvent = _eventBus
        .on<MovieSearchResultFavoriteListUpdatedEvent>()
        .listen((event) {
      var simpleList = <MovieSimpleSearchResponse>[];
      for (var movieFavorite in event.movieSearchResonspeList) {
        simpleList.add(MovieSimpleSearchResponse(
          title: movieFavorite.title,
          year: movieFavorite.year,
          imdbID: movieFavorite.imdbID,
          mediaType: movieFavorite.type,
          posterURL: movieFavorite.posterURL,
        ));
      }
      emit(MovieShowState(simpleList));
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptionMovieSearchResultFavoriteListUpdatedEvent.cancel();
    return super.close();
  }
}
