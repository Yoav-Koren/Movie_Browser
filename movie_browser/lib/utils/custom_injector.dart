import 'package:auto_injector/auto_injector.dart';
import 'package:event_bus/event_bus.dart';
import 'package:movie_browser/domain/interfaces/interface_http_manager.dart';
import 'package:movie_browser/domain/managers/hive_manager.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';

class CustomInjector {
  static AutoInjector injector = AutoInjector(on: (i) {
    i.addSingleton<EventBus>(EventBus.new);
    i.addSingleton<IHttpManager>(HttpManager.new);
    i.commit();
  });
}
