import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/screens/home/medicines_list.dart';
import '../../screens/home/calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: deviceHeight * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Journal",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.black),
                      ),
                      Icon(
                        Icons.notifications_none,
                        size: 42.0,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Calendar(),
                SizedBox(height: deviceHeight*0.05),
                MedicinesList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
