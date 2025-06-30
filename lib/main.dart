import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Updated path for home_screen.dart
import 'screens/formulation_page.dart'; // Updated path for formulation_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayurvedic Ratio Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set home screen to HomeScreen
    );
  }
}
