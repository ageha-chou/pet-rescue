import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/routes/app_pages.dart';

import 'modules/home/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Rescue',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(165, 213, 213, 1),
        backgroundColor: Color.fromRGBO(253, 246, 240, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(165, 213, 213, 1),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(19, 44, 51, 1),
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(19, 44, 51, 1),
              ),
              headline5: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(19, 44, 51, 1),
              ),
              subtitle2: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 12,
                color: Colors.blueGrey,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromRGBO(165, 213, 213, 0.8),
        ),
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
