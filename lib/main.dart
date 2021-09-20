import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Rescue',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(165, 213, 213, 1),
        accentColor: Color.fromRGBO(165, 213, 213, 0.8),
        backgroundColor: Color.fromRGBO(253, 246, 240, 1),
        cardTheme: CardTheme(
          color: Color.fromRGBO(216, 227, 231, 1),
        ),
      ),
      home: TabsScreen(),
    );
  }
}
