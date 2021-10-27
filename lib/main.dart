import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/auth/sign_in/sign_in_screen.dart';
import 'package:pet_rescue/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
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
              headline4: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 12,
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
      // initialRoute: Routes.HOME,
      home: SignInScreen(),
      getPages: AppPages.routes,
    );
  }
}
