import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/pagination_control/pagination_control_bloc.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/pages/favorites_page.dart';
import 'package:movie_browser/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:movie_browser/views/widgets/movie_search_result_list_view.dart';
import 'package:movie_browser/views/widgets/pagination_widget.dart';
import 'package:movie_browser/views/widgets/search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CustomSearchBar(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.history, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          MovieSearchResultListView(),
          BlocProvider(
            create: (context) =>
                PaginationControlBloc(CustomInjector.injector.get<EventBus>()),
            child: PaginationWidget(),
          )
        ],
      ),
    );
  }
}
