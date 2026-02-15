import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/search_bar/search_bar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:event_bus/event_bus.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBarBloc(CustomInjector.injector.get<EventBus>()),
      child: BlocBuilder<SearchBarBloc, SearchBarState>(
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          child: SizedBox(
                            child: TextField(
                              onChanged: (data) {
                                context
                                    .read<SearchBarBloc>()
                                    .add(SearchTermUpdated(searchTerm: data));
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                //TODO change later
                                hintText: 'Search movies...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.read<SearchBarBloc>().add(SearchButtonClicked());
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
