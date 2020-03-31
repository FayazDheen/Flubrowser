import 'package:flutter/material.dart';
import 'package:flubrowser/home.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home())));
    return Scaffold(
      body: Center(
          child:  Image.asset('asset/apklogo.png',
          width: 150,
          ),
          ),
    );
  }
}
