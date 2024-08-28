import 'package:flutter/material.dart';
import 'package:recipe_manager_app/Views/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Manager App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}