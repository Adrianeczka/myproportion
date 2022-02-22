import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/themes/themes.dart';

final dateTimeProvider = StateProvider<DateTime?>((ref) => DateTime.now());

class Calendar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: CalendarTimeline(
        showYears: false,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (data) {
          ref.read(dateTimeProvider.state).state = data;
        },
        leftMargin: 20,
        monthColor: Colors.teal[500],
        dayColor: Colors.teal[500],
        dayNameColor: Colors.black54,
        activeDayColor: CustomColors.ecru,
        activeBackgroundDayColor: Colors.redAccent[100],
        dotsColor: Colors.black54,
        locale: 'en',
      ),
    );
  }
}
