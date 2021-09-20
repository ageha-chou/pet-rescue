import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/tabs_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
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
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 44, 51, 1),
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(19, 44, 51, 1),
              ),
            ),
      ),
      home: TabsScreen(),
    );
  }
}
