import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/favorite_movie_list_view/favorite_movie_list_view_bloc.dart';
import 'package:movie_browser/l10n/app_localizations.dart';
import 'package:movie_browser/views/widgets/movie_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<FavoriteMovieListViewBloc,
                FavoriteMovieListViewState>(
              buildWhen: (previous, current) => current is MovieShowState,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: state is MovieShowState
                      ? MovieListView(
                          movieList: state.results,
                        )
                      : Center(
                          child:
                              Text(AppLocalizations.of(context)!.noFavorites)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
