import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_proportion/models/proposed_product.dart';

import '../services/get_proposed_product.dart';

class ProductsExchangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wymieniam na...')),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final proposedProduct = watch(getProposedProductProvider);
          return proposedProduct.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Text('${error.toString()}'),
            ),
            data: (proposedProduct) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${proposedProduct.proposedProductList?[index].namePl}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Text(
                      '${proposedProduct.proposedProductList?[index].weight}g',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
                itemCount: proposedProduct.proposedProductList?.length,
              );
            },
          );
        }),
      ),
    );
  }
}
