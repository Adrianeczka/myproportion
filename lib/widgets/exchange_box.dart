import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/debouncer.dart';

import '../models/exchange_product_provider.dart';

import '../themes/themes.dart';

final searchProductProvider = StateProvider<String>((ref) => '');

final exchangeProductStateProvider =
    StateProvider<ExchangeProductState>((ref) => ExchangeProductState.pro);

class ExchangeBox extends ConsumerWidget {
  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: _buildSearchByName(ref, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    /**
                     * @todo
                     */
                    // Navigator.of(context).push(
                    //   HeroDialogRoute(
                    //     builder: (context) => CategoryBox(),
                    //   ),
                    // );
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Podobne',
                        style: TextStyle(color: Colors.black54)),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(CustomColors.gold),
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.lightBlue,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pro', style: TextStyle(color: Colors.black54)),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(CustomColors.gold),
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.gold,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child:
                        Text('Dobre', style: TextStyle(color: Colors.black54)),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(CustomColors.gold),
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.green,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Średnie',
                        style: TextStyle(color: Colors.black54)),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(CustomColors.gold),
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.yellow,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildSearchByName(WidgetRef ref, BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Wyszukaj produkt po nazwie'),
      onChanged: (textFromSearchProductByName) {
        _debouncer.run(() {
          ref.read(searchProductProvider.notifier).state =
              textFromSearchProductByName;
          ref.read(exchangeProductStateProvider.notifier).state =
              ExchangeProductState.searchedByName;
        });
      },
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
