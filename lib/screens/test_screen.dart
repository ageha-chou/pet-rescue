import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final String title;

  TestScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
