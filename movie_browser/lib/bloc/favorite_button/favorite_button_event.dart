part of 'favorite_button_bloc.dart';

@immutable
abstract class FavoriteButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class MovieFavoriteButtonClickedEvent extends FavoriteButtonEvent {
  final MovieSearchResponse movieSearchResponse;

  MovieFavoriteButtonClickedEvent(this.movieSearchResponse);

  @override
  List<Object?> get props => [movieSearchResponse];
}

@immutable
class MovieUnFavoriteButtonClickedEvent extends FavoriteButtonEvent {
  final String title;

  MovieUnFavoriteButtonClickedEvent(this.title);

  @override
  List<Object?> get props => [title];
}
