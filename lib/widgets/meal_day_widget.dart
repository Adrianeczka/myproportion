import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/themes/themes.dart';

import '../services/get_diet_day.dart';

import '../widgets/product_day_widget.dart';
import '../models/diet_day.dart';

//it's render meal's

class MealDayWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<DietDay> _dietDay = ref.watch(getDietDayProvider);
    return SingleChildScrollView(
      child: _dietDay.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('${error.toString()}'),
        ),
        data: (_dietDay) {
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, mealIndex) {
              var mealDay = _dietDay.mealsDay![mealIndex];
              return Card(
                color: CustomColors.ecru,
                shadowColor: CustomColors.gold,
                elevation: 4,
                margin: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '${mealDay.meal!.namePl}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    displayProductsDay(mealDay.productsDay),
                  ],
                ),
              );
            },
            itemCount: _dietDay.mealsDay?.length,
          );
        },
      ),
    );
  }
}
