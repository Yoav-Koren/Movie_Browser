import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/bloc/pagination_control/pagination_control_bloc.dart';
import 'package:movie_browser/utils/custom_injector.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<PaginationControlBloc>()
                  .add(PaginationBackPageEvent());
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<PaginationControlBloc>()
                  .add(PaginationNextPageEvent());
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
