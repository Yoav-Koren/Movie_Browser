import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';

@immutable
class SaveToFavoritesEvent extends Equatable {
  final MovieData search;
  const SaveToFavoritesEvent(this.search);

  @override
  List<Object?> get props => [search];
}

@immutable
class DeleteFromFavoritesEvent extends Equatable {
  final String title;
  const DeleteFromFavoritesEvent(this.title);

  @override
  List<Object?> get props => [title];
}

@immutable
class LoadFromFavoritesEvent extends Equatable {
  const LoadFromFavoritesEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class SaveSearchEvent extends Equatable {
  final String search;
  const SaveSearchEvent(this.search);

  @override
  List<Object?> get props => [search];
}

@immutable
class DeleteSearchEvent extends Equatable {
  final String search;
  const DeleteSearchEvent(this.search);

  @override
  List<Object?> get props => [search];
}

@immutable
class ClearSearchHistoryEvent extends Equatable {
  const ClearSearchHistoryEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class MovieFavoriteListUpdatedEvent extends Equatable {
  final List<MovieData> movieSearchResonspeList;
  const MovieFavoriteListUpdatedEvent(this.movieSearchResonspeList);

  @override
  List<Object?> get props => [movieSearchResonspeList];
}

@immutable
class SearchHistoryListUpdatedEvent extends Equatable {
  final List<String> searchHistoryList;
  const SearchHistoryListUpdatedEvent(this.searchHistoryList);

  @override
  List<Object?> get props => [searchHistoryList];
}

@immutable
class MovieFavoriteListRequestEvent extends Equatable {
  const MovieFavoriteListRequestEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class SearchHistoryListRequestEvent extends Equatable {
  const SearchHistoryListRequestEvent();

  @override
  List<Object?> get props => [];
}
