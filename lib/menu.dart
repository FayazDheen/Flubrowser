import 'package:flubrowser/appinfo.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void choiceAction(String choice) {
    print("Working");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AppInfo()));
            } else if (value == 1) {

            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: ListTile(
                  title: Text("App Info"),
                  leading: Icon(Icons.info),
                  dense: true,
                ),
                value: 0,
              ),
              // PopupMenuItem(
              //   child: ListTile(
              //     title: Text("Settings"),
              //     leading: Icon(Icons.settings),
              //     dense: true,
              //   ),
              //   value: 1,
              // )
            ];
          },
        ),
      ],
    );
  }
}
