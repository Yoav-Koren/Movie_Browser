import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/favorite_button/favorite_button_bloc.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/l10n/app_localizations.dart';
import 'package:movie_browser/utils/custom_injector.dart';
import 'package:movie_browser/views/widgets/favorite_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieData movie;

  const MovieDetailsWidget({
    super.key,
    required this.movie,
  });

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
                        label: AppLocalizations.of(context)!.imdb,
                        value: movie.imdbRating.toString(),
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 12),
                      _buildRatingBadge(
                        label: AppLocalizations.of(context)!.metascore,
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
                    AppLocalizations.of(context)!.plot,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(movie.plot),
                  const SizedBox(height: 24),
                  _buildInfoSection(AppLocalizations.of(context)!.director,
                      movie.director, context),
                  _buildInfoSection(AppLocalizations.of(context)!.writers,
                      movie.writers, context),
                  _buildInfoSection(AppLocalizations.of(context)!.actors,
                      movie.actors, context),
                  const SizedBox(height: 24),
                  _buildInfoSection(AppLocalizations.of(context)!.awards,
                      movie.awards, context),
                  _buildInfoSection(AppLocalizations.of(context)!.country,
                      movie.country, context),
                  _buildInfoSection(AppLocalizations.of(context)!.language,
                      movie.language, context),
                  _buildInfoSection(AppLocalizations.of(context)!.boxOffice,
                      movie.boxOffice, context),
                  _buildInfoSection(AppLocalizations.of(context)!.production,
                      movie.production, context),
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

  Widget _buildInfoSection(String title, String value, BuildContext context) {
    if (value.isEmpty || value == AppLocalizations.of(context)!.notAvailable) {
      return const SizedBox();
    }

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
