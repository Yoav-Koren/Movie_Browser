part of 'movie_card_bloc.dart';

@immutable
class MovieCardState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class MovieCardInitial extends MovieCardState {}

@immutable
class ShowMovieSearchResultState extends MovieCardState {
  final MovieSearchResponse response;

  ShowMovieSearchResultState(this.response);

  @override
  List<Object?> get props => [response];
}
