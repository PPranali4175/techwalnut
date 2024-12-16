 // For JSON decoding
import 'package:flutter/material.dart'; // Core Flutter package

import 'package:techwalnut/screens/dashboard_screen.dart'; // For reading JSON files

void main() {
  runApp(FoodMenuApp());
}

class FoodMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenuScreen(),
    );
  }
}
