import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/movie_card/movie_card_bloc.dart';
import 'package:movie_browser/bloc/search_results_list_view/search_results_list_view_bloc.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/widgets/movie_details_widget.dart';
import 'package:movie_browser/views/widgets/pagination_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/views/widgets/simple_movie_card.dart';

class MovieSearchResultListView extends StatelessWidget {
  const MovieSearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchResultsListViewBloc(
              CustomInjector.injector.get<EventBus>()),
        ),
        BlocProvider(
          create: (context) =>
              MovieCardBloc(CustomInjector.injector.get<EventBus>()),
        ),
      ],
      child: BlocBuilder<SearchResultsListViewBloc, SearchResultsListViewState>(
        builder: (context, state) {
          return BlocListener<MovieCardBloc, MovieCardState>(
            listener: (context, state) {
              if (state is ShowMovieSearchResultState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailsWidget(movie: state.response),
                  ),
                );
              }
            },
            child: Expanded(
              child: state is SearchResultsShowState
                  ? GridView.builder(
                      itemCount: state.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 2.0,
                      ),
                      itemBuilder: (context, index) => BlocProvider(
                        create: (context) => MovieCardBloc(
                            CustomInjector.injector.get<EventBus>()),
                        child: SimpleMovieCard(movie: state.results[index]),
                      ),
                    )
                  : const Center(child: Text('No results')),
            ),
          );
        },
      ),
    );
  }
}
