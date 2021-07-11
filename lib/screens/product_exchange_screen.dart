import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/exchange_box.dart';
import '../widgets/functions/changingVariousTypeChange.dart';
import '../models/exchange_product_provider.dart';

class ProductsExchangeScreen extends StatelessWidget {
  final productDay;

  const ProductsExchangeScreen({@required this.productDay});

  @override
  Widget build(BuildContext context) {
    var parameters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wymiana produktu'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExchangeBox(
              productDay: parameters,
            ),
            Consumer(builder: (context, watch, child) {
              final proposedProduct =
                  watch(exchangeProductProvider(productDay));
              return proposedProduct!.when(
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('${error.toString()}'),
                ),
                data: (proposedProduct) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var product = proposedProduct.proposedProductList?[index];
                      return Column(
                        children: [
                          ListTile(
                            leading:
                                changingVariousTypeChange(product?.typeChange),
                            title: Text(
                              '${product?.namePl}',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            trailing: Text(
                              '${product?.weight} g',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    },
                    itemCount: proposedProduct.proposedProductList?.length,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
