import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkScheme = (ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 4, 99, 125),
));

final appTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 18,
      )),
  dropdownMenuTheme: const DropdownMenuThemeData().copyWith(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: kColorScheme.onSecondaryContainer,
    ),
  ),
);

final darkColorTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kDarkScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkScheme.primaryContainer,
    foregroundColor: kDarkScheme.onPrimaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkScheme.primaryContainer,
      foregroundColor: kDarkScheme.onPrimaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kDarkScheme.onSecondaryContainer,
        fontSize: 18,
      )),
);
