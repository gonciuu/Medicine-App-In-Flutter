import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Day {
  String dayLetter;
  String dayNumber;
  bool isChecked;

  Day({this.dayLetter, this.dayNumber, this.isChecked});

  List<Day> getCurrentDays() {
    final List<Day> daysList = List();
    DateTime currentTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      daysList.add(Day(
          dayLetter: DateFormat.E().format(currentTime).toString()[0],
          dayNumber: DateFormat.d().format(currentTime).toString(),isChecked: false));
      currentTime = currentTime.add(Duration(days: 1));
    }
    daysList[0].isChecked = true;
    return daysList;
  }
}
