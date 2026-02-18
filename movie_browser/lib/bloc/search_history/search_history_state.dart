part of 'search_history_bloc.dart';

@immutable
abstract class SearchHistoryState extends Equatable {
  final List<String> searches;
  const SearchHistoryState(this.searches);
  @override
  List<Object?> get props => [searches];
}

@immutable
class SearchHistoryInitial extends SearchHistoryState {
  const SearchHistoryInitial(super.searches);

  @override
  List<Object?> get props => [];
}

@immutable
class LoadSearchHistoryState extends SearchHistoryState {
  const LoadSearchHistoryState(super.searches);
}
