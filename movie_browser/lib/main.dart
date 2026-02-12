import 'package:flutter/material.dart';
import 'package:movie_browser/domain/managers/http_manager.dart';

Future<void> main() async {
  HttpManager _manager = HttpManager();
  var response = await _manager.getRequest("1917", "db392504");
  print(response);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie Browser",
      home: Container(),
    );
  }
}
