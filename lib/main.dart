import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine/screens/add_new_medicine/add_new_medicine.dart';
import 'package:medicine/screens/home/home.dart';
import './screens/welcome/welcome.dart';

void main() {
  runApp(MedicineApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black.withOpacity(0.05),
    statusBarColor: Colors.black.withOpacity(0.05),
    statusBarIconBrightness: Brightness.dark
  ));
}

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
      routes: {
        "/": (context) => Welcome(),
        "/home": (context) => Home(),
        "/add_new_medicine": (context) => AddNewMedicine(),
      },
      initialRoute: "/",
    );
  }
}
