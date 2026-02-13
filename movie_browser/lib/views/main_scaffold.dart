import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/views/pages/favorites_page.dart';
import 'package:movie_browser/views/pages/search_page.dart';
import 'package:movie_browser/views/widgets/custom_bottom_navigation_bar.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarBloc(),
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
              children: [SearchPage(), FavoritesPage()],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
