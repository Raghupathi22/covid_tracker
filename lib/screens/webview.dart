import 'package:covid19/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {

InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Donate to WHO',
        ),
        leading: IconButton(
          icon: Icon(Icons.home,color: Colors.white,),
          onPressed:(){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
            );
          }
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: (){
               if (_webViewController != null) {
                   _webViewController.goBack();
                }
            },
          ),
          IconButton(
            icon:Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: (){
               if (_webViewController != null) {
                   _webViewController.goForward();
                }
            },
          ),
          IconButton(
            icon:Icon(Icons.refresh),
            color: Colors.grey[900],
            onPressed: (){
              if (_webViewController != null) {
                   _webViewController.reload();
               }
            },
          ),
        ],
      ),
        body: Container(
            child: Column(children: <Widget>[
              Container(
                //  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress,backgroundColor: Colors.purple,)
                      : Container(color:Colors.black,width:5)
                 ),
              Expanded(
                child: Container(
                 /// margin: const EdgeInsets.all(10.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    initialUrl: 'https://covid19responsefund.org/',
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewController = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, String url) async {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),
              ),
              
            ])),
      ),
    );
  }
}


class MythBusters extends StatefulWidget {
  @override
  _MythBustersState createState() => _MythBustersState();
}

class _MythBustersState extends State<MythBusters> {

  InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Myth Busters',
        ),
        leading: IconButton(
          icon: Icon(Icons.home,color: Colors.white,),
          onPressed:(){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
            );
          }
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: (){
               if (_webViewController != null) {
                   _webViewController.goBack();
                }
            },
          ),
          IconButton(
            icon:Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: (){
               if (_webViewController != null) {
                   _webViewController.goForward();
                }
            },
          ),
          IconButton(
            icon:Icon(Icons.refresh),
            color: Colors.grey[900],
            onPressed: (){
              if (_webViewController != null) {
                   _webViewController.reload();
               }
            },
          ),
        ],
      ),
        body: Container(
            child: Column(children: <Widget>[
              Container(
                //  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress,backgroundColor: Colors.purple,)
                      : Container(color:Colors.black,width:5)
                 ),
              Expanded(
                child: Container(
                 /// margin: const EdgeInsets.all(10.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    initialUrl: 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters',
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _webViewController = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, String url) async {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),
              ),
              
            ])),
      ),
    );
  }
}


