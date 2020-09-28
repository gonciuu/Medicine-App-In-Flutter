import "package:flutter/material.dart";
import '../../models/day.dart';

class CalendarDay extends StatefulWidget {
  final Day day;
  final Function onDayClick;

  CalendarDay(this.day, this.onDayClick);

  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.day.dayLetter,
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 17.0,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 12.0,
        ),
        GestureDetector(
          onTap: () => widget.onDayClick(widget.day),
          child: CircleAvatar(
            backgroundColor: widget.day.isChecked
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            child: Text(
              widget.day.dayNumber,
              style: TextStyle(
                  color: widget.day.isChecked ? Colors.white : Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
