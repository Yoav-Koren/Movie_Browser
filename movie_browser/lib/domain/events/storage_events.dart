import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';

@immutable
class SaveToFavoritesEvent extends Equatable {
  final MovieSearchResponse search;
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
class MovieSearchResultFavoriteListUpdatedEvent extends Equatable {
  final List<MovieSearchResponse> movieSearchResonspeList;
  const MovieSearchResultFavoriteListUpdatedEvent(this.movieSearchResonspeList);

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
class MovieSearchResultFavoriteListRequestEvent extends Equatable {
  const MovieSearchResultFavoriteListRequestEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class SearchHistoryListRequestEvent extends Equatable {
  const SearchHistoryListRequestEvent();

  @override
  List<Object?> get props => [];
}
