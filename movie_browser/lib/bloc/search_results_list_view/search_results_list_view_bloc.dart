import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_simple_search_response.dart';
import 'package:movie_browser/domain/events/communication_events.dart';

part 'search_results_list_view_event.dart';
part 'search_results_list_view_state.dart';

class SearchResultsListViewBloc
    extends Bloc<SearchResultsListViewEvent, SearchResultsListViewState> {
  final EventBus _eventBus;

  SearchResultsListViewBloc(this._eventBus)
      : super(SearchResultsListViewInitial()) {
    on<SearchResultsListViewEvent>((event, emit) {});

    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    _eventBus.on<MovieResultsEvents>().listen((event) {
      emit(SearchResultsShowState(event.results));
    });

    _eventBus.on<MovieNotFoundEvent>().listen((event) {
      //TODO FIX LATER
      emit(SearchResultsErrorState("No Movie Found"));
    });

    _eventBus.on<ConnectionFailedEvent>().listen((event) {
      //TODO FIX LATER
      emit(SearchResultsErrorState(event.message ?? "Connection Error!"));
    });
  }
}
