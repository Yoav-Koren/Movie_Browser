import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_results_list_view_event.dart';
part 'search_results_list_view_state.dart';

class SearchResultsListViewBloc extends Bloc<SearchResultsListViewEvent, SearchResultsListViewState> {
  SearchResultsListViewBloc() : super(SearchResultsListViewInitial()) {
    on<SearchResultsListViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
