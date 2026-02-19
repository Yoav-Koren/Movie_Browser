part of 'search_movie_list_view_bloc.dart';

@immutable
class SearchMovieListViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SearchResultsListViewInitial extends SearchMovieListViewState {
  @override
  List<Object?> get props => [];
}

@immutable
class MovieShowState extends SearchMovieListViewState {
  final List<MovieDataSimple> results;
  MovieShowState(this.results);
  @override
  List<Object?> get props => [results];
}

@immutable
class SearchResultsErrorState extends SearchMovieListViewState {
  final String error;
  SearchResultsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
