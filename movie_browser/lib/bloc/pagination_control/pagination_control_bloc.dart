import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/ui_events.dart';
import 'package:equatable/equatable.dart';
part 'pagination_control_event.dart';
part 'pagination_control_state.dart';

class PaginationControlBloc
    extends Bloc<PaginationControlEvent, PaginationControlState> {
  int _page = 1;
  String _searchTerm = "";
  final EventBus _eventBus;
  late final StreamSubscription<NewSearchTermEvent>
      _streamSubscriptionNewSearchTermEvent;
  PaginationControlBloc(this._eventBus) : super(PaginationControlInitial()) {
    on<PaginationControlEvent>((event, emit) {});
    on<PaginationNextPageEvent>((event, emit) {
      _page++;
      _eventBus.fire(SearchByWordEvent(search: _searchTerm, page: _page));
    });

    on<PaginationBackPageEvent>((event, emit) {
      _page = _page - 1;
      if (_page < 1) {
        _page = 1;
      }
      _eventBus.fire(SearchByWordEvent(search: _searchTerm, page: _page));
    });
    _eventBusEventListening();
  }

  void _eventBusEventListening() {
    _streamSubscriptionNewSearchTermEvent =
        _eventBus.on<NewSearchTermEvent>().listen((event) {
      _page = 1;
      _searchTerm = event.search;
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptionNewSearchTermEvent.cancel();
    return super.close();
  }
}
