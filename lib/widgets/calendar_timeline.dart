import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarTimeline(
        showYears: false,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (data) {},
        leftMargin: 20,
        monthColor: Colors.teal,
        dayColor: Colors.teal[200],
        dayNameColor: Color(0xFF333A47),
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Colors.redAccent[100],
        dotsColor: Color(0xFF333A47),
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en',
      ),
    );
  }
}
