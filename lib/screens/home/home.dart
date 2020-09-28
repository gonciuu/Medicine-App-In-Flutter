import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final daysList = List();
  @override
  void initState() {
    super.initState();

    DateTime currentTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      print(currentTime.day);
      daysList.add({
        "dayNumber": DateFormat.d().format(currentTime).toString(),
        "dayName": DateFormat.E().format(currentTime).toString()[0]
      });
      currentTime = currentTime.add(Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
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
              Container(
                height: deviceHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...daysList
                        .map((day) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  day["dayName"],
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Text(
                                    day["dayNumber"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ))
                        .toList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
