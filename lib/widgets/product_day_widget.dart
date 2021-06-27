import 'package:flutter/material.dart';

import '../widgets/functions/changingVariousTypeChange.dart';

displayProductsDay(productsDay) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, productIndex) {
      var productDay = productsDay![productIndex];
      return Column(
        children: [
          ListTile(
            leading: changingVariousTypeChange(productDay.typeChange),
            title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/product_exchange_screen',
                    arguments: productDay.product.id);
              },
              child: Text(
                '${productDay.product!.namePl}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            trailing: Text(
              '${productDay.weight}g',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Divider()
        ],
      );
    },
    itemCount: productsDay?.length,
  );
}
