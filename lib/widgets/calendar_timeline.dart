import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeProvider = StateProvider<DateTime?>((ref) => DateTime.now());

class Calendar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      child: CalendarTimeline(
        showYears: false,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (data) {
          context.read(dateTimeProvider).state = data;
        },
        leftMargin: 20,
        monthColor: Colors.teal,
        dayColor: Colors.teal[200],
        dayNameColor: Color(0xFF333A47),
        activeDayColor: Colors.white,
        activeBackgroundDayColor: Colors.redAccent[100],
        dotsColor: Color(0xFF333A47),
        locale: 'en',
      ),
    );
  }
}
