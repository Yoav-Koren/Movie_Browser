import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/data_structs/movie_data_simple.dart';

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
class ConnectionSuccessfulEvent extends Equatable {
  const ConnectionSuccessfulEvent();

  @override
  List<Object?> get props => [];
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
class MovieResultsEvent extends Equatable {
  final List<MovieDataSimple> results;
  const MovieResultsEvent(this.results);

  @override
  List<Object?> get props => [results];
}

@immutable
class MovieFullResultEvent extends Equatable {
  final MovieData result;
  const MovieFullResultEvent(this.result);

  @override
  List<Object?> get props => [result];
}

@immutable
class UnableToFetchPosterEvent extends Equatable {
  final String exceptionMessage;
  const UnableToFetchPosterEvent(this.exceptionMessage);

  @override
  List<Object?> get props => [exceptionMessage];
}
