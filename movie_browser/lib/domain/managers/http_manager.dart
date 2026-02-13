import 'package:dio/dio.dart';
import 'package:movie_browser/consts/const_strings.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';

class HttpManager implements IHttpManager {
  final Dio _dio = Dio();

  HttpManager();

  @override
  Future<dynamic> getImageRequest(String url) async {
    return throw UnimplementedError();
  }

  @override
  Future<dynamic> getRequest(String title, String apiKey) async {
    var response = await _dio.get(
        "${ConstString.apiURL}${ConstString.apiSearchByTitleHeader}$title${ConstString.apiKeyHeader}$apiKey");
    return response.data;
  }
}
