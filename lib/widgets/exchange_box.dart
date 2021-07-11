import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/freezed_classes.dart';
import 'package:my_proportion/models/diet_day.dart';
import '../widgets/category_box.dart';
import '../widgets/hero_dialog_route.dart';
import '../widgets/debouncer.dart';

import '../models/exchange_product_provider.dart';

import '../themes/themes.dart';

final searchProductProvider = StateProvider<String?>((ref) => null);

final exchangeProductStateProvider =
    StateProvider<ExchangeProductState>((ref) => ExchangeProductState.pro);

class ExchangeBox extends ConsumerWidget {
  final List buttonName = ['Podobne', 'Pro', 'Dobre', 'Średnie'];
  final List buttonColor = [
    CustomColors.lightBlue,
    CustomColors.gold,
    CustomColors.green,
    CustomColors.yellow
  ];
  final _debouncer = Debouncer(milliseconds: 1000);

  final ProductDay productDay;
  final Parameters? parameters;

  ExchangeBox({required this.productDay, this.parameters});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Card(
      elevation: 6,
      shadowColor: CustomColors.gold,
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOldProductName(),
                  _buildAdjustingQuantity(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildSearchByName(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      HeroDialogRoute(
                        builder: (context) => CategoryBox(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Wyszukaj produkt po kategorii'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Wybierz kolor produktu',
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExchangeButton(buttonName[0], buttonColor[0]),
                  ExchangeButton(buttonName[1], buttonColor[1]),
                  ExchangeButton(buttonName[2], buttonColor[2]),
                  ExchangeButton(buttonName[3], buttonColor[3]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildSearchByName(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Wyszukaj produkt po nazwie'),
      onChanged: (textFromSearchProductByName) {
        _debouncer.run(() {
          context.read(searchProductProvider).state =
              textFromSearchProductByName;
          context.read(exchangeProductStateProvider).state =
              ExchangeProductState.searchedByName;
        });
      },
    );
  }
}

//Button

class ExchangeButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;

  const ExchangeButton(this.buttonName, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(buttonName, style: TextStyle(color: Colors.black54)),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(4),
        shadowColor: MaterialStateProperty.all(CustomColors.gold),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

//TextFormField

Widget _buildOldProductName() {
  return Text('Bułka',
      style: TextStyle(
        color: CustomColors.gold,
        fontSize: 22,
        fontFamily: 'Montserrat',
      ));
}

Widget _buildAdjustingQuantity() {
  return Container(
    height: 30,
    width: 140,
    child: TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          hintText: 'ilość (gram)',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          )),
    ),
  );
}
