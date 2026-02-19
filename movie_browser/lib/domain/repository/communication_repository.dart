import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/consts/hive_enums/media_type.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/data_structs/movie_data_simple.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
import 'package:movie_browser/domain/interfaces/interface_communication_repository.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/consts/const_enums.dart';
import 'package:dio/dio.dart';

class CommunicationRepository implements ICommunicationRepository {
  final AutoInjector _autoInjector;
  late final HttpManager _httpManager;
  late final EventBus _eventBus;
  List<MovieData> _searchResponseFavoriteList = [];
  CommunicationRepository(this._autoInjector) {
    _httpManager = _autoInjector.get<IHttpManager>() as HttpManager;
    _eventBus = _autoInjector.get<EventBus>();
    _eventBus.fire(MovieFavoriteListRequestEvent());
    _listenToEventBusEvents();
  }

  void _compileResponse(Response<dynamic> response) {
    if (response.statusCode == ConstNumbers.successfulResponseStatusCode) {
      if (response.data != null) {
        var data = response.data as Map<String, dynamic>;
        if (data[ConstString.apiResponseHeader] ==
                ConstString.apiFalseResponse &&
            data[ConstString.apiErrorResponse] ==
                ConstString.apiMovieNotFoundResponse) {
          _eventBus.fire(MovieNotFoundEvent());
        }
        if (data[ConstString.apiResponseHeader] ==
                ConstString.apiTrueResponse &&
            data.containsKey(ConstString.apiMovieSearchResponse)) {
          _convertResultsToObjects(data);
        }
        if (data[ConstString.apiResponseHeader] ==
                ConstString.apiTrueResponse &&
            !data.containsKey(ConstString.apiMovieSearchResponse)) {
          _convertFullResultToObject(data);
        }
      } else {
        _eventBus
            .fire(ConnectionFailedEvent(ConstString.connectionErrorNoData));
      }
    }
  }

  Future<void> _convertResultsToObjects(Map<String, dynamic> data) async {
    var results = data[ConstString.apiMovieSearchResponse] as List;
    var listOfResults = <MovieDataSimple>[];
    for (var result in results) {
      try {
        result as Map<String, dynamic>;

        var temp = MovieDataSimple(
          title: result[ConstString.apiMovieTitleHeader],
          year: result[ConstString.apiMovieYearHeader],
          imdbID: result[ConstString.apiMovieImdbIDHeader],
          mediaType: MediaType.values.firstWhere((element) =>
              element.name.toLowerCase() ==
              result[ConstString.apiMovieTypeHeader].toString().toLowerCase()),
          posterURL: result[ConstString.apiMoviePosterHeader],
        );
        listOfResults.add(temp);
      } catch (e) {
        _eventBus.fire(ErrorParsingDataEvent());
      }
    }
    _eventBus.fire(MovieResultsEvent(listOfResults));
  }

  void _compileFailedResponse(DioException response) {
    if (response.type == DioExceptionType.connectionTimeout ||
        response.type == DioExceptionType.receiveTimeout ||
        response.type == DioExceptionType.connectionError) {
      _eventBus.fire(ConnectionFailedEvent(response.error.toString()));
    } else if (response.response != null) {
      final statusCode = response.response?.statusCode;
      final message =
          response.response?.data?[ConstString.connectionMessageHeader] ??
              ConstString.connectionMessageDefaultMessage;

      _eventBus.fire(ConnectionFailedEvent(
          '${ConstString.connectionMessageApiErrorMessage} [$statusCode]: $message'));
    } else {
      _eventBus.fire(ConnectionFailedEvent(
          ConstString.connectionMessageUnknownErrorMessage));
    }
  }

  Future<void> _convertFullResultToObject(Map<String, dynamic> data) async {
    try {
      var ratings = data[ConstString.apiMovieRatingsHeader] as List;
      var listOfRatings = <MovieRatings>[];
      for (var rating in ratings) {
        rating as Map<String, dynamic>;
        var tempRating = MovieRatings(
            source: rating[ConstString.apiMovieSourceResponse],
            value: rating[ConstString.apiMovieRatingsValueResponse]);
        listOfRatings.add(tempRating);
      }
      bool isFavorite = false;
      for (var favorite in _searchResponseFavoriteList) {
        if (favorite.imdbID == data[ConstString.apiMovieImdbIDHeader]) {
          isFavorite = true;
        }
      }

      var temp = MovieData(
          title: data[ConstString.apiMovieTitleHeader],
          year: data[ConstString.apiMovieYearHeader],
          releaseDate: data[ConstString.apiMovieReleaseDateHeader],
          runtime: data[ConstString.apiMovieRunTimeHeader],
          rating: data[ConstString.apiMovieRatedHeader],
          genre: data[ConstString.apiMovieGenreHeader],
          director: data[ConstString.apiMovieDirectorHeader],
          writers: data[ConstString.apiMovieWriterHeader],
          actors: data[ConstString.apiMovieActorsHeader],
          plot: data[ConstString.apiMoviePlotHeader],
          language: data[ConstString.apiMovieLanguageHeader],
          country: data[ConstString.apiMovieCountryHeader],
          awards: data[ConstString.apiMovieAwardsHeader],
          posterURL: data[ConstString.apiMoviePosterHeader],
          ratings: listOfRatings,
          metascore: data[ConstString.apiMovieMetascoreHeader],
          imdbRating: data[ConstString.apiMovieImdbRatingHeader],
          imdbVotes: data[ConstString.apiMovieImdbVotesHeader],
          imdbID: data[ConstString.apiMovieImdbIDHeader],
          type: MediaType.values.firstWhere((element) =>
              element.name.toLowerCase() ==
              data[ConstString.apiMovieTypeHeader].toString().toLowerCase()),
          dvd: data.containsKey(ConstString.apiMovieDVDHeader)
              ? data[ConstString.apiMovieDVDHeader]
              : ConstString.apiMovieNonApplicableHeader,
          boxOffice: data[ConstString.apiMovieBoxOfficeHeader],
          production: data[ConstString.apiMovieProductionHeader],
          websiteURL: data[ConstString.apiMovieWebsiteHeader],
          isFavorite: isFavorite);
      _eventBus.fire(MovieFullResultEvent(temp));
    } catch (e) {
      _eventBus.fire(ErrorParsingDataEvent());
    }
  }

  void _listenToEventBusEvents() {
    _eventBus.on<MovieFavoriteListUpdatedEvent>().listen((event) {
      _searchResponseFavoriteList = event.movieSearchResonspeList;
    });

    _eventBus.on<SearchByWordEvent>().listen((event) async {
      String encodedString = Uri.encodeComponent(event.search);
      var response = await _httpManager.getRequest(
        ConstString.apiURL,
        searchHeader: ConstString.apiSearchByWordHeader,
        searchResult: encodedString,
        pageHeader: ConstString.pageHeader,
        pageNumber: event.page ?? ConstNumbers.defaultPage,
        apiKey: ConstString.apiKey,
      );
      if (response is Response<dynamic>) {
        _compileResponse(response);
      }
      if (response is DioException) {
        _compileFailedResponse(response);
      }
      if (response is Exception && response is! DioException) {
        _eventBus.fire(ConnectionFailedEvent(response.toString()));
      }
    });

    _eventBus.on<SearchByTitleEvent>().listen((event) async {
      String encodedString = Uri.encodeComponent(event.search);
      var response = await _httpManager.getRequest(
        ConstString.apiURL,
        searchHeader: ConstString.apiSearchByTitleHeader,
        searchResult: encodedString,
        pageHeader: ConstString.pageHeader,
        pageNumber: ConstNumbers.defaultPage,
        apiKey: ConstString.apiKey,
      );
      if (response is Response<dynamic>) {
        _eventBus.fire(ConnectionSuccessfulEvent());
        _compileResponse(response);
      }
      if (response is DioException) {
        _compileFailedResponse(response);
        _eventBus.fire(ConnectionFailedEvent(response.toString()));
      }
      if (response is Exception && response is! DioException) {
        _eventBus.fire(ConnectionFailedEvent(response.toString()));
      }
    });
  }
}
