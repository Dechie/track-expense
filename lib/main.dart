import 'package:flutter/material.dart';

import 'package:exptrack/themes.dart';
import 'package:exptrack/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    */
  runApp(
    MaterialApp(
      theme: appTheme,
      darkTheme: darkColorTheme,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
  //});
}
