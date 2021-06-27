import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/functions/changingVariousTypeChange.dart';

import '../services/get_proposed_product.dart';

class ProductsExchangeScreen extends StatelessWidget {
  final productId;

  const ProductsExchangeScreen({@required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wymieniam na...')),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          final proposedProduct = watch(getProposedProductProvider(productId));
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
                  var product = proposedProduct.proposedProductList?[index];
                  return ListTile(
                    leading: changingVariousTypeChange(product?.typeChange),
                    title: Text(
                      '${product?.namePl}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Text(
                      '${product?.weight}g',
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
