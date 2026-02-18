import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
import 'package:movie_browser/domain/events/ui_events.dart';

part 'search_bar_event.dart';
part 'search_bar_state.dart';

class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {
  String _searchTerm = "";
  final EventBus _eventBus;

  SearchBarBloc(this._eventBus) : super(SearchBarState("")) {
    on<SearchBarEvent>((event, emit) {});
    on<SearchTermUpdated>((event, emit) {
      _searchTerm = event.searchTerm;
      emit(SearchBarState(_searchTerm));
    });
    on<SearchButtonClicked>((event, emit) {
      if (_searchTerm != "") {
        _eventBus.fire(SearchByWordEvent(search: _searchTerm));
        _eventBus.fire(NewSearchTermEvent(_searchTerm));
        _eventBus.fire(SaveSearchEvent(_searchTerm));
      }
    });
  }
}
