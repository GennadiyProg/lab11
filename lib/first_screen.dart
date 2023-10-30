import 'dart:async';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  String url = "https://source.unsplash.com/random/800x600";
  Text myText =
      const Text("This is a nice photo!", textDirection: TextDirection.ltr);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      changeURL();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          myText,
          InkWell(
            onTap: changeURL,
            child: Image.network(url),
          )
        ]
    );
  }

  void changeURL() {
    setState(() {
      url = "https://source.unsplash.com/random/800x600/?" +
          "q=${DateTime.now().millisecondsSinceEpoch}";
    });
  }
}
