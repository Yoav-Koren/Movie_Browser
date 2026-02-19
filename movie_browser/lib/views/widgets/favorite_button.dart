import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/bloc/favorite_button/favorite_button_bloc.dart';
import 'package:movie_browser/bloc/movie_card/movie_card_bloc.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/events/storage_events.dart';

class FavoriteButton extends StatelessWidget {
  final MovieData movie;
  final double size;

  const FavoriteButton({
    super.key,
    required this.movie,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<FavoriteButtonBloc, FavoriteButtonState>(
      buildWhen: (previous, current) => current is FavoriteButtonInitial,
      builder: (context, state) {
        return Material(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusGeometry.all(Radius.circular(size / 2))),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              state is FavoriteButtonInitial && state.isFavorite
                  ? context
                      .read<FavoriteButtonBloc>()
                      .add(MovieUnFavoriteButtonClickedEvent(movie.title))
                  : context
                      .read<FavoriteButtonBloc>()
                      .add(MovieFavoriteButtonClickedEvent(movie));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  state is FavoriteButtonInitial && state.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  key: ValueKey(
                      state is FavoriteButtonInitial && state.isFavorite),
                  size: size,
                  color: state is FavoriteButtonInitial && state.isFavorite
                      ? (Colors.red)
                      : (Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
