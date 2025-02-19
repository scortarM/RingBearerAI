import 'package:flutter/material.dart';
import 'screens/ring_size_screen.dart'; // Import the RingSizeScreen class

void main() {
  runApp(RingBearerApp());
}

class RingBearerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RingBearerAI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RingSizeScreen(),  // Set the RingSizeScreen as the home screen
    );
  }
}
