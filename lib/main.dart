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
        image: Image.network('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.vexels.com%2Fmedia%2Fusers%2F3%2F131563%2Fisolated%2Fpreview%2F93e49b6c5668d156aaee447bd9804fab-newspaper-circle-icon-by-vexels.png&f=1&nofb=1'),
        photoSize: 50,
        loaderColor: Colors.red,
        ),
    );
  }
}
