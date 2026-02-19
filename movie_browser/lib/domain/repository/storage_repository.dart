import 'package:hive/hive.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/data_structs/movie_data.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/events/storage_events.dart';
import 'package:movie_browser/domain/interfaces/interface_storage_repository.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/domain/managers/hive_manager.dart';

class StorageRepository implements IStorageRepository {
  late final AutoInjector _autoInjector;
  late final EventBus _eventBus;
  late final Box<MovieData> _movieResponseBox;
  late final Box<String> _searchHistoryBox;
  late final HiveManager _movieResponseHiveManager;
  late final HiveManager _searchHistoryHiveManager;
  bool isOnline = true;

  StorageRepository(this._autoInjector) {
    _onStart();
  }

  Future<void> _onStart() async {
    _eventBus = _autoInjector.get<EventBus>();

    _searchHistoryBox =
        await Hive.openBox<String>(ConstString.hiveSearchHistoryBoxName);
    _movieResponseBox =
        await Hive.openBox<MovieData>(ConstString.hiveMoviesBox);

    _movieResponseHiveManager = HiveManager(_movieResponseBox);
    _searchHistoryHiveManager = HiveManager(_searchHistoryBox);

    _listenToEventBusEvents();
  }

  void _listenToEventBusEvents() {
    _eventBus.on<ConnectionFailedEvent>().listen((event) {
      isOnline = false;
    });

    _eventBus.on<ConnectionSuccessfulEvent>().listen((event) {
      isOnline = true;
    });

    _eventBus.on<SearchByTitleEvent>().listen((event) {
      if (!isOnline) {
        _eventBus.fire(MovieFullResultEvent(
            _movieResponseHiveManager.fetchData(event.search) as MovieData));
      }
    });

    _eventBus.on<SearchHistoryListRequestEvent>().listen((event) {
      _eventBus.fire(SearchHistoryListUpdatedEvent(
          _searchHistoryHiveManager.fetchAllData() as List<String>));
    });

    _eventBus.on<MovieFavoriteListRequestEvent>().listen((event) {
      _eventBus.fire(MovieFavoriteListUpdatedEvent(
          _movieResponseHiveManager.fetchAllData() as List<MovieData>));
    });

    _eventBus.on<ClearSearchHistoryEvent>().listen((event) async {
      if (await _searchHistoryHiveManager.deleteAllData()) {
        _eventBus.fire(SearchHistoryListUpdatedEvent(
            _searchHistoryHiveManager.fetchAllData() as List<String>));
      }
    });

    _eventBus.on<DeleteSearchEvent>().listen((event) async {
      if (await _searchHistoryHiveManager.deleteData(event.search)) {
        _eventBus.fire(SearchHistoryListUpdatedEvent(
            _searchHistoryHiveManager.fetchAllData() as List<String>));
      }
    });

    _eventBus.on<SaveSearchEvent>().listen((event) {
      _searchHistoryHiveManager.addData(event.search, event.search);
      _eventBus.fire(SearchHistoryListUpdatedEvent(
          _searchHistoryHiveManager.fetchAllData() as List<String>));
    });

    _eventBus.on<SaveToFavoritesEvent>().listen((event) {
      _movieResponseHiveManager.addData(event.search.title, event.search);
      _eventBus.fire(MovieFavoriteListUpdatedEvent(
          _movieResponseHiveManager.fetchAllData() as List<MovieData>));
    });

    _eventBus.on<DeleteFromFavoritesEvent>().listen((event) async {
      if (await _movieResponseHiveManager.deleteData(event.title)) {
        _eventBus.fire(MovieFavoriteListUpdatedEvent(
            _movieResponseHiveManager.fetchAllData() as List<MovieData>));
      }
    });
  }
}
