import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: MyUrl(),
      debugShowCheckedModeBanner: false,
    ));

class MyUrl extends StatefulWidget {
  @override
  _MyUrlState createState() => _MyUrlState();
}

class _MyUrlState extends State<MyUrl> {
  Future<void> _LaunchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'cant launch the url';
    }
  }

  @override
  String toLaunch = 'https://www.google.com';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launch'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              toLaunch,
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () => setState(() {
                _LaunchInBrowser(toLaunch);
              }),
              child: Text('Launch'),
            ),
          ],
        ),
      ),
    );
  }
}

