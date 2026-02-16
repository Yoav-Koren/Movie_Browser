import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/domain/data_structs/movie_simple_search_response.dart';

@immutable
class SearchByWordEvent extends Equatable {
  final String search;
  final int? page;
  const SearchByWordEvent({required this.search, this.page});

  @override
  List<Object?> get props => [search, page];
}

@immutable
class SearchByTitleEvent extends Equatable {
  final String search;
  const SearchByTitleEvent(this.search);

  @override
  List<Object?> get props => [search];
}

@immutable
class ConnectionFailedEvent extends Equatable {
  final String? message;
  const ConnectionFailedEvent(this.message);

  @override
  List<Object?> get props => [message];
}

@immutable
class MovieNotFoundEvent extends Equatable {
  const MovieNotFoundEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class ErrorParsingDataEvent extends Equatable {
  const ErrorParsingDataEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class MovieResultsEvents extends Equatable {
  final List<MovieSimpleSearchResponse> results;
  const MovieResultsEvents(this.results);

  @override
  List<Object?> get props => [results];
}

@immutable
class MovieFullResultEvents extends Equatable {
  final MovieSearchResponse result;
  const MovieFullResultEvents(this.result);

  @override
  List<Object?> get props => [result];
}

@immutable
class UnableToFetchPosterEvents extends Equatable {
  final String exceptionMessage;
  const UnableToFetchPosterEvents(this.exceptionMessage);

  @override
  List<Object?> get props => [exceptionMessage];
}
