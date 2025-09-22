import 'package:flutter/material.dart';
import 'package:coffeeappui/pages/util/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        primaryColor: const Color(0xFFD4A574),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4A574),
          secondary: Color(0xFFD4A574),
          surface: Color(0xFF2A2A2A),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}