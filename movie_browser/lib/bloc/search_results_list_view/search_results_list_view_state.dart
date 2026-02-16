part of 'search_results_list_view_bloc.dart';

@immutable
class SearchResultsListViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SearchResultsListViewInitial extends SearchResultsListViewState {
  @override
  List<Object?> get props => [];
}

@immutable
class SearchResultsShowState extends SearchResultsListViewState {
  final List<MovieSimpleSearchResponse> results;
  SearchResultsShowState(this.results);
  @override
  List<Object?> get props => [results];
}

@immutable
class SearchResultsErrorState extends SearchResultsListViewState {
  final String error;
  SearchResultsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
