import 'package:dio/dio.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/events/communication_events.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';
import 'package:event_bus/event_bus.dart';

class HttpManager implements IHttpManager {
  final Dio _dio = Dio();

  HttpManager();

  @override
  Future<dynamic> getImageRequest(String url) async {
    return throw UnimplementedError();
  }

  @override
  Future<dynamic> getRequest(String url,
      {required String searchHeader,
      required String searchResult,
      required String apiKey,
      required String pageHeader,
      int? pageNumber = 1}) async {
    try {
      var response = await _dio.get(
          "$url$searchHeader$searchResult$pageHeader${pageNumber.toString()}${ConstString.apiKeyHeader}$apiKey",
          options: Options(
              connectTimeout: Duration(seconds: 5),
              receiveTimeout: Duration(seconds: 5)));
      return response;
    } on DioException catch (e) {
      return e;
    } catch (e) {
      return e;
    }
  }
}
