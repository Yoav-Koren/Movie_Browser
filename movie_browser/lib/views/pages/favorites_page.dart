import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/favorite_movie_list_view.dart/favorite_movie_list_view_bloc.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/views/pages/search_page.dart';
import 'package:movie_browser/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:movie_browser/views/widgets/movie_list_view.dart';
import 'package:movie_browser/views/widgets/pagination_widget.dart';
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
                      : const Center(child: Text('No Favorites')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
