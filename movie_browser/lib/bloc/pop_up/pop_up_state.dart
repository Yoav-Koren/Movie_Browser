part of 'pop_up_bloc.dart';

@immutable
abstract class PopUpState extends Equatable {}

class PopUpInitial extends PopUpState {
  @override
  List<Object?> get props => [];
}

@immutable
class ShowMovieSearchResultState extends PopUpState {
  final MovieSearchResponse response;

  ShowMovieSearchResultState(this.response);

  @override
  List<Object?> get props => [response];
}
