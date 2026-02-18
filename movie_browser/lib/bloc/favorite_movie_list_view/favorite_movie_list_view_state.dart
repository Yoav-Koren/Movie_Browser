part of 'favorite_movie_list_view_bloc.dart';

@immutable
class FavoriteMovieListViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class FavoriteMovieListViewInitial extends FavoriteMovieListViewState {
  @override
  List<Object?> get props => [];
}

@immutable
class MovieShowState extends FavoriteMovieListViewState {
  final List<MovieSimpleSearchResponse> results;
  MovieShowState(this.results);
  @override
  List<Object?> get props => [results];
}
