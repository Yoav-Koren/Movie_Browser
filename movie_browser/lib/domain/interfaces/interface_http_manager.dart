abstract class IHttpManager {
  Future<dynamic> getRequest(String title, String apiKey);
  Future<dynamic> getImageRequest(String url);
}
