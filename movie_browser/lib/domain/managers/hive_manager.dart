import 'package:hive/hive.dart';
import 'package:movie_browser/domain/interfaces/interface_hive_manager.dart';

class HiveManager implements IHiveManger {
  late final Box<dynamic> _hiveBox;

  HiveManager(this._hiveBox);

  @override
  void addData(String key, data) {
    _hiveBox.put(key, data);
  }

  @override
  Future<bool> deleteData(String key) async {
    await _hiveBox.delete(key);
    return true;
  }

  @override
  Future<bool> deleteAllData() async {
    await _hiveBox.clear();
    return true;
  }

  @override
  List<dynamic> fetchAllData() {
    return _hiveBox.values.toList();
  }

  @override
  dynamic fetchData(String key) {
    return _hiveBox.get(key);
  }
}
