import 'package:flutter/material.dart';
import '../widgets/calendar_timeline.dart';
import '../widgets/meal_day_widget.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyProportion'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Calendar(),
            MealDayWidget(),
          ],
        ),
      ),
    );
  }
}
