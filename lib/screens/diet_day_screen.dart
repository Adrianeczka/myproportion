import 'package:flutter/material.dart';
import 'package:my_proportion/widgets/meal_day_widget.dart';

class DietDayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MealDayWidget(),
          ],
        ),
      ),
    );
  }
}
