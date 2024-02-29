import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.indigo,
    background: Colors.grey[800]!,
  ),
  useMaterial3: true,
);

// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: ColorScheme.dark(
//       background: Colors.grey[800]!,
//       primary: Colors.grey[800]!,
//       secondary: Colors.grey[800]!),
//       inputDecorationTheme: InputDecorationTheme()
// );

