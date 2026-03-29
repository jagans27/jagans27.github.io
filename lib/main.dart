import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/controllers/root_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setUrlStrategy(PathUrlStrategy());
  setUrlStrategy(const HashUrlStrategy());

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RootController())],
      child: const App(),
    ),
  );
}
