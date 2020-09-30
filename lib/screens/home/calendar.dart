import 'package:flutter/material.dart';
import '../../models/day.dart';
import '../../screens/home/calendar_day.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final Day _days = Day();
  List<Day> _daysList;

  @override
  void initState() {
    super.initState();
    _daysList = _days.getCurrentDays();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Container(
      height: deviceHeight * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [..._daysList.map((day) => CalendarDay(day, onDayClick))],
      ),
    );
  }

  void onDayClick(Day clickedDay) {
    setState(() {
      for (Day day in _daysList) {
        day.isChecked = false;
      }
      _daysList[_daysList.indexOf(clickedDay)].isChecked = true;
    });
  }
}
