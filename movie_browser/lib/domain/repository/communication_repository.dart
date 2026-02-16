import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/data_structs/movie_ratings.dart';
import 'package:movie_browser/domain/data_structs/movie_search_response.dart';
import 'package:movie_browser/domain/data_structs/movie_simple_search_response.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
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
  CommunicationRepository(this._autoInjector) {
    _httpManager = _autoInjector.get<IHttpManager>() as HttpManager;
    _eventBus = _autoInjector.get<EventBus>();
    _listenToBlocEvents();
  }

  void _listenToBlocEvents() {
    _eventBus.on<SearchByWordEvent>().listen((event) async {
      String encodedString = Uri.encodeComponent(event.search);
      var response = await _httpManager.getRequest(
        ConstString.apiURL,
        searchHeader: ConstString.apiSearchByWordHeader,
        searchResult: encodedString,
        pageHeader: ConstString.pageHeader,
        pageNumber: event.page ?? 1,
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
        pageNumber: 1,
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
  }

  void _compileResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      if (response.data != null) {
        var data = response.data as Map<String, dynamic>;
        if (data['Response'] == 'False' &&
            data['Error'] == 'Movie not found!') {
          _eventBus.fire(MovieNotFoundEvent());
        }
        if (data['Response'] == 'True' && data.containsKey('Search')) {
          _convertResultsToObjects(data);
        }
        if (data['Response'] == 'True' && !data.containsKey('Search')) {
          _convertFullResultToObject(data);
        }
      } else {
        //TODO chagne later
        _eventBus.fire(ConnectionFailedEvent("NO DATA"));
      }
    }
  }

  Future<void> _convertResultsToObjects(Map<String, dynamic> data) async {
    var results = data['Search'] as List;
    var listOfResults = <MovieSimpleSearchResponse>[];
    for (var result in results) {
      try {
        result as Map<String, dynamic>;
        var image = await _fetchPoster(result);
        if (image! is Image) {
          image = null;
        }
        var temp = MovieSimpleSearchResponse(
            title: result['Title'],
            year: result['Year'],
            imdbID: result['imdbID'],
            mediaType: MediaType.values.firstWhere((element) =>
                element.name.toLowerCase() ==
                result['Type'].toString().toLowerCase()),
            posterURL: result['Poster'],
            poster: image ?? image);
        listOfResults.add(temp);
      } catch (e) {
        print(e);
        _eventBus.fire(ErrorParsingDataEvent());
      }
    }
    _eventBus.fire(MovieResultsEvents(listOfResults));
  }

  Future<dynamic> _fetchPoster(Map<String, dynamic> result) async {
    var imageData = await _httpManager.getImageRequest(result['Poster']);
    var image;
    if (imageData is Uint8List) {
      image = Image.memory(
        imageData,
        fit: BoxFit.cover,
      );
    }
    if (imageData is Exception) {
      _eventBus.fire(UnableToFetchPosterEvents(imageData.toString()));
      image = CircularProgressIndicator(strokeWidth: 2);
    }
    return image;
  }

  void _compileFailedResponse(DioException response) {
    if (response.type == DioExceptionType.connectionTimeout ||
        response.type == DioExceptionType.receiveTimeout ||
        response.type == DioExceptionType.connectionError) {
      _eventBus.fire(ConnectionFailedEvent(response.error.toString()));
    } else if (response.response != null) {
      final statusCode = response.response?.statusCode;
      final message =
          response.response?.data?['message'] ?? 'Unknown API error';

      _eventBus
          .fire(ConnectionFailedEvent('API error [$statusCode]: $message'));
    } else {
      //TODO chagne later
      _eventBus.fire(ConnectionFailedEvent("UNKNOWN ERROR"));
    }
  }

  Future<void> _convertFullResultToObject(Map<String, dynamic> data) async {
    try {
      var ratings = data['Ratings'] as List;
      var listOfRatings = <MovieRatings>[];
      for (var rating in ratings) {
        rating as Map<String, dynamic>;
        var tempRating =
            MovieRatings(source: rating['Source'], value: rating['Value']);
        listOfRatings.add(tempRating);
      }
      var image = await _fetchPoster(data);
      var temp = MovieSearchResponse(
          title: data['Title'],
          year: data['Year'],
          releaseDate: data['Released'],
          runtime: data['Runtime'],
          rating: data['Rated'],
          genre: data['Genre'],
          director: data['Director'],
          writers: data['Writer'],
          actors: data['Actors'],
          plot: data['Plot'],
          language: data['Language'],
          country: data['Country'],
          awards: data['Awards'],
          posterURL: data['Poster'],
          ratings: listOfRatings,
          metascore: data['Metascore'],
          imdbRating: data['imdbRating'],
          imdbVotes: data['imdbVotes'],
          imdbID: data['imdbID'],
          type: MediaType.values.firstWhere((element) =>
              element.name.toLowerCase() ==
              data['Type'].toString().toLowerCase()),
          dvd: data.containsKey('DVD') ? data['DVD'] : "N/A",
          boxOffice: data['BoxOffice'],
          production: data['Production'],
          websiteURL: data['Website'],
          poster: image ?? image);
      _eventBus.fire(MovieFullResultEvents(temp));
    } catch (e) {
      _eventBus.fire(ErrorParsingDataEvent());
    }
  }
}
