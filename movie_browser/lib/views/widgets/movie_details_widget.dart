import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/favorite_button/favorite_button_bloc.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/widgets/favorite_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieSearchResponse movie;

  const MovieDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.posterURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.white,
                      child: const Icon(Icons.movie, size: 40),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.black87, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie.year} • ${movie.runtime} • ${movie.rating}",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildRatingBadge(
                        label: "IMDb",
                        value: movie.imdbRating.toString(),
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 12),
                      _buildRatingBadge(
                        label: "Metascore",
                        value: movie.metascore.toString(),
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    children: movie.genre
                        .split(',')
                        .map(
                          (g) => Chip(
                            label: Text(g.trim()),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Plot",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(movie.plot),
                  const SizedBox(height: 24),
                  _buildInfoSection("Director", movie.director),
                  _buildInfoSection("Writers", movie.writers),
                  _buildInfoSection("Actors", movie.actors),
                  const SizedBox(height: 24),
                  _buildInfoSection("Awards", movie.awards),
                  _buildInfoSection("Country", movie.country),
                  _buildInfoSection("Language", movie.language),
                  _buildInfoSection("Box Office", movie.boxOffice),
                  _buildInfoSection("Production", movie.production),
                  const SizedBox(height: 40),
                  BlocProvider(
                    create: (context) => FavoriteButtonBloc(
                        CustomInjector.injector.get<EventBus>(),
                        movie.isFavorite),
                    child: FavoriteButton(
                      movie: movie,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge({
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String value) {
    if (value.isEmpty || value == "N/A") return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
