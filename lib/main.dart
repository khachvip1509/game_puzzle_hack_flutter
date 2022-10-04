import 'package:flutter/material.dart';
import 'package:game_puzzle_hack_flutter/src/inject_dependencies.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/my_app.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}
