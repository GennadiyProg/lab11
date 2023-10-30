import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdScreen();
  }
}

class _ThirdScreen extends State<ThirdScreen> {
  String url = "https://source.unsplash.com/random/800x600";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          onPressed: changeURL,
          child: const Text("Press Me"),
        ),
        Image.network(url)
      ])
    );
  }

  void changeURL() {
    setState(() {
      url = "https://source.unsplash.com/random/800x600/?" +
          "q=${new DateTime.now().millisecondsSinceEpoch}";
    });
  }
}
