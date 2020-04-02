import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/services.dart';
import 'menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebViewController _webViewController;
  var _teController = new TextEditingController();
  bool showLoading = false;

  void updateLoading(bool ls) {
    this.setState(() {
      showLoading = ls;
    });
  }

  String currURL = "";
  // WebViewController controllerGlobal;

  Future<bool> _exitApp(BuildContext context) async {
    if (await _webViewController.canGoBack()) {
      print("onwill goback");
      _webViewController.canGoBack();
      return true;
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No back history item")),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                              flex: 2,
                              child: IconButton(
                                splashColor: Colors.blue,
                                  icon: Icon(
                                    Icons.home,
                                    
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    String finalURL = "http://www.google.co.in";
                                    if (_webViewController != null) {
                                      updateLoading(true);
                                      _webViewController
                                          .loadUrl(finalURL)
                                          .then((onValue) {})
                                          .catchError((e) {
                                        updateLoading(false);
                                      });
                                    }
                                  })),
                          Flexible(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // autofocus: true,
                                dragStartBehavior: DragStartBehavior.start,
                                textInputAction: TextInputAction.search,
                                toolbarOptions: ToolbarOptions(
                                    cut: false,
                                    copy: true,
                                    paste: true,
                                    selectAll: true),
                                cursorColor: Colors.black,
                                autocorrect: false,
                                // enableInteractiveSelection: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: "Search or type web address",
                                    focusColor: Colors.white,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.white,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.white,
                                          width: 2),
                                    )),
                                controller: _teController,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Center(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  tooltip: "Search",
                                  onPressed: () {
                                    String finalURL = _teController.text;
                                    print("finalURL" + finalURL);
                                    if (finalURL == "") {
                                      //  print("object");
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(
                                                  "Please Enter Valid URL and Search!"),
                                              title: Text("Alert!"),
                                              actions: <Widget>[
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("OK"))
                                              ],
                                            );
                                          });
                                    } else if (!finalURL.contains('.') ||
                                        finalURL.contains(' ')) {
                                      finalURL =
                                          "https://google.co.in/search?q=" +
                                              finalURL;
                                    } else if (!finalURL
                                            .startsWith("http://") &&
                                        !finalURL.startsWith("https://")) {
                                      finalURL = "http://" + finalURL;
                                    } else if (finalURL.startsWith("http://") ||
                                        finalURL.startsWith("https://")) {}

                                    // else if (finalURL.startsWith("http://") ||
                                    //     finalURL.startsWith("https://")) {
                                    //   // finalURL=finalURL;
                                    //   print(finalURL);
                                    // }

                                    if (_webViewController != null) {
                                      updateLoading(true);
                                      _webViewController
                                          .loadUrl(finalURL)
                                          .then((onValue) {})
                                          .catchError((e) {
                                        updateLoading(false);
                                      });
                                    }
                                  }),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Center(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Colors.black,
                                  ),
                                  tooltip: "Refresh",
                                  onPressed: () {
                                    String finalURL = currURL;
                                    if (_webViewController != null) {
                                      updateLoading(true);
                                      _webViewController
                                          .loadUrl(finalURL)
                                          .then((onValue) {})
                                          .catchError((e) {
                                        updateLoading(false);
                                      });
                                    }
                                  }),
                            ),
                          ),
                          Flexible(flex: 1, child: Center(child: Menu()))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: 2,
                ),
                (showLoading) ? LinearProgressIndicator(backgroundColor: Colors.grey,) : Container(),
                Flexible(
                    flex: 9,
                    child: Stack(
                      children: <Widget>[
                        WebView(

                          initialUrl: 'http://google.co.in',
                          onPageFinished: (data) {
                            updateLoading(false);
                            currURL = data;
                            print("currURL" + currURL);
                            _teController.text = currURL;
                          },
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (webViewController) {
                            _webViewController = webViewController;
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
