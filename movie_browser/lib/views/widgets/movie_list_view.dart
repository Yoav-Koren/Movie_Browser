import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/movie_card/movie_card_bloc.dart';
import 'package:movie_browser/domain/data_structs/movie_data_simple.dart';

import 'package:movie_browser/utils/custom_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/views/widgets/simple_movie_card.dart';

// ignore: must_be_immutable
class MovieListView extends StatelessWidget {
  List<MovieDataSimple> movieList;
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
