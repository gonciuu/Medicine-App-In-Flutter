import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './screens/welcome/welcome.dart';

void main() => runApp(MedicineApp());

class MedicineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "Popins",
            primaryColor: Color.fromRGBO(7, 190, 200, 1),
            textTheme: TextTheme(
                headline1: ThemeData.light().textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 38.0,
                      fontFamily: "Popins",
                    ),
                headline5: ThemeData.light().textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      fontFamily: "Popins",
                    ),
            headline3: ThemeData.light().textTheme.headline3.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              fontFamily: "Popins",
            ))),
        home: Welcome());
  }
}
