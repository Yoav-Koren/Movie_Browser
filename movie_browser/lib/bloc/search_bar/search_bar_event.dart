part of 'search_bar_bloc.dart';

@immutable
class SearchBarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SearchTermUpdated extends SearchBarEvent {
  final String searchTerm;
  SearchTermUpdated({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

@immutable
class SearchButtonClicked extends SearchBarEvent {}
