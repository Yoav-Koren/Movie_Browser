import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/bloc/search_history/search_history_bloc.dart';

class SearchHistoryDialog extends StatelessWidget {
  const SearchHistoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 400,
        width: 350,
        child: Column(
          children: [
            const Text(
              "Search History",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
                builder: (context, state) {
                  if (state.searches.isEmpty) {
                    return const Center(
                      child: Text("No search history"),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.searches.length,
                    itemBuilder: (context, index) {
                      final search = state.searches[index];

                      return ListTile(
                        title: Text(search),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context
                                .read<SearchHistoryBloc>()
                                .add(RemoveSearchEvent(search));
                          },
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.read<SearchHistoryBloc>().add(ClearHistoryEvent());
                },
                child: const Text(
                  "Clear All",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
