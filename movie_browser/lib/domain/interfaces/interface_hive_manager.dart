abstract class IHiveManger {
  List<dynamic> fetchAllData();
  dynamic fetchData(String key);
  void addData(String key, dynamic data);
  Future<bool> deleteData(String key);
  Future<bool> deleteAllData();
}
