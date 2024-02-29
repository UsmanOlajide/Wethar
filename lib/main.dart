import 'package:flutter/material.dart';
import 'package:wethar/screens/loading_screen.dart';
import 'package:wethar/screens/location_screen.dart';
import 'package:wethar/themes/dark_theme.dart';
import 'package:wethar/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoadingScreen(),
    );
  }
}
