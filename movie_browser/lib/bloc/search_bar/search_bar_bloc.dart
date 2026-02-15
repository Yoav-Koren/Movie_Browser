import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/events/communication_events.dart';

part 'search_bar_event.dart';
part 'search_bar_state.dart';

class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {
  String searchTerm = "";
  final EventBus _eventBus;

  SearchBarBloc(this._eventBus) : super(SearchBarState("")) {
    on<SearchBarEvent>((event, emit) {});
    on<SearchTermUpdated>((event, emit) {
      searchTerm = event.searchTerm;
      emit(SearchBarState(searchTerm));
    });
    on<SearchButtonClicked>((event, emit) {
      if (searchTerm != "") {
        _eventBus.fire(SearchByWordEvent(searchTerm));
      }
    });
  }
}
