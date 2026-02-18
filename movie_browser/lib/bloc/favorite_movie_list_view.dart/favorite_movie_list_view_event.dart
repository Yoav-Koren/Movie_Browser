part of 'favorite_movie_list_view_bloc.dart';

@immutable
sealed class FavoriteMovieListViewEvent extends Equatable {}

@immutable
class FavoriteListViewRequestListEvent extends FavoriteMovieListViewEvent {
  @override
  List<Object> get props => [];
}
