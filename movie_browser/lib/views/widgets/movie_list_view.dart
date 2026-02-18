import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/movie_card/movie_card_bloc.dart';
import 'package:movie_browser/bloc/search_movie_list_view/search_movie_list_view_bloc.dart';
import 'package:movie_browser/domain/data_structs/movie_simple_search_response.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/widgets/movie_details_widget.dart';
import 'package:movie_browser/views/widgets/pagination_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/views/widgets/simple_movie_card.dart';

class MovieListView extends StatelessWidget {
  List<MovieSimpleSearchResponse> movieList;
  MovieListView({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) => BlocProvider(
        create: (context) =>
            MovieCardBloc(CustomInjector.injector.get<EventBus>()),
        child: SimpleMovieCard(movie: movieList[index]),
      ),
    );
  }
}
