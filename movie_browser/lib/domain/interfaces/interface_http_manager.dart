import 'package:dio/dio.dart';

abstract class IHttpManager {
  Future<dynamic> getRequest(String url,
      {required String searchHeader,
      required String searchResult,
      required String apiKey,
      required String pageHeader,
      int? pageNumber = 1});
  Future<dynamic> getImageRequest(String url);
}
