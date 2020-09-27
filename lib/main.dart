import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Popins",
        primaryColor: Color.fromRGBO(7, 203, 194, 1),
      ),
      home: Scaffold(
        body: Center(
            child: Text(
          "Something",
              style: Theme.of(context).textTheme.bodyText2,
        )),
      ),
    );
  }
}
