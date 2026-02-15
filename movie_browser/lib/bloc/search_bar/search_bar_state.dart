part of 'search_bar_bloc.dart';

@immutable
class SearchBarState extends Equatable {
  final String searchResult;
  const SearchBarState(this.searchResult);
  @override
  List<Object?> get props => [searchResult];
}
