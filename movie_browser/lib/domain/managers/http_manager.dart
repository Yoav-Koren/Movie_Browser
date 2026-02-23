import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:movie_browser/consts/const_nums.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';

class HttpManager implements IHttpManager {
  final Dio _dio = Dio();

  HttpManager();

  @override
  Future<dynamic> getImageRequest(String imageURL) async {
    try {
      final response = await _dio.get(
        imageURL,
        options: Options(responseType: ResponseType.bytes),
      );

      return Uint8List.fromList(response.data);
    } on DioException catch (e) {
      return e;
    } catch (e) {
      return e;
    }
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
              connectTimeout:
                  Duration(seconds: ConstNumbers.connectionTimeOutSeconds),
              receiveTimeout:
                  Duration(seconds: ConstNumbers.connectionTimeOutSeconds)));
      return response;
    } on DioException catch (e) {
      return e;
    } catch (e) {
      return e;
    }
  }
}
