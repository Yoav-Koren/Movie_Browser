part of 'favorite_button_bloc.dart';

@immutable
abstract class FavoriteButtonState extends Equatable {
  const FavoriteButtonState();
  @override
  List<Object?> get props => [];
}

@immutable
class FavoriteButtonInitial extends FavoriteButtonState {
  final bool isFavorite;
  const FavoriteButtonInitial(this.isFavorite);
  @override
  List<Object?> get props => [isFavorite];
}
