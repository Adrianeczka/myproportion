import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/controller/providers.dart';

import '../widgets/product_day_widget.dart';
import '../models/diet_day.dart';

class MealDayWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<DietDay> _dietDay = watch(getDietDayProvider);
    return Container(
      height: 700,
      child: Center(
          child: _dietDay.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('${error.toString()}'),
        ),
        data: (_dietDay) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, mealIndex) {
              var mealDay = _dietDay.mealsDay![mealIndex];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 15),
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
      )),
    );
  }
}
