part of 'search_history_bloc.dart';

@immutable
abstract class SearchHistoryEvent extends Equatable {}

@immutable
class RemoveSearchEvent extends SearchHistoryEvent {
  final String query;
  RemoveSearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

@immutable
class LoadSearchHistoryEvent extends SearchHistoryEvent {
  LoadSearchHistoryEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class ClearHistoryEvent extends SearchHistoryEvent {
  @override
  List<Object?> get props => [];
}
