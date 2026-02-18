part of 'movie_card_bloc.dart';

@immutable
class MovieCardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class MovieCardClickedEvent extends MovieCardEvent {
  final String title;

  MovieCardClickedEvent(this.title);

  @override
  List<Object?> get props => [title];
}
