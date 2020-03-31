import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                Color.fromRGBO(0, 0, 102, 1),
                Color.fromRGBO(51, 102, 204, 1),
              ],
              stops: [0.4, 1.0],
              radius: 0.8,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "FLUBROWSER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "asset/apklogo.png",
                  width: 150,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

