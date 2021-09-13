import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Home(),
        title: Text('NewsSwen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        loaderColor: Colors.red,
        ),
    );
  }
}
