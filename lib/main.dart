import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,             //for only portrait orientation
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => Splash(),
        '/home': (_) => Home(),
      },
    );
  }
}
