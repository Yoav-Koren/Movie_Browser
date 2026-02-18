import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/bloc/favorite_movie_list_view.dart/favorite_movie_list_view_bloc.dart';
import 'package:movie_browser/bloc/pop_up/pop_up_bloc.dart';
import 'package:movie_browser/bloc/search_movie_list_view/search_movie_list_view_bloc.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/pages/favorites_page.dart';
import 'package:movie_browser/views/pages/search_page.dart';
import 'package:movie_browser/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/views/widgets/movie_details_widget.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BottomNavBarBloc(CustomInjector.injector.get<EventBus>()),
        ),
        BlocProvider(
          create: (context) =>
              PopUpBloc(CustomInjector.injector.get<EventBus>()),
        ),
      ],
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              //TODO change later
              title: Text(state.currentPage == PageRoutings.searchPageIndex
                  ? "Search"
                  : "Favorites"),
              backgroundColor: Colors.black,
            ),
            body: IndexedStack(
              index: state.currentPage.index,
              children: [
                BlocProvider(
                    create: (context) => SearchMovieListViewBloc(
                        CustomInjector.injector.get<EventBus>()),
                    child: SearchPage()),
                BlocProvider(
                  create: (context) => FavoriteMovieListViewBloc(
                      CustomInjector.injector.get<EventBus>())
                    ..add(FavoriteListViewRequestListEvent()),
                  child: FavoritesPage(),
                ),
                BlocListener<PopUpBloc, PopUpState>(
                  listener: (context, state) {
                    if (state is ShowMovieSearchResultState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MovieDetailsWidget(movie: state.response),
                        ),
                      );
                    }
                  },
                  child: Container(),
                )
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
