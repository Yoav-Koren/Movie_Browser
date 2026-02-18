import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:movie_browser/l10n/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: state.currentPage.index,
          onTap: (index) {
            PageRoutings pageIndex = PageRoutings.values
                .firstWhere((pageRoute) => pageRoute.index == index);
            context
                .read<BottomNavBarBloc>()
                .add(NavigateToPageEvent(pageIndex));
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppLocalizations.of(context)!.searchHint,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: AppLocalizations.of(context)!.tabFavorites,
            ),
          ],
        );
      },
    );
  }
}
