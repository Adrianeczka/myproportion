import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/diet_day.dart';
import '../widgets/exchange_box.dart';
import '../services/get_product_list.dart';
import '../services/get_product_by_name.dart';
import '../models/proposed_product.dart';

enum ExchangeProductState {
  searchedByName,
  // searchedByCategory,
  // similar,
  pro,
  // good, medium,
}

final exchangeProductProvider = Provider.autoDispose.family<AsyncValue<ProductList>, ProductDay>((ref, productDay) {
  final state = ref.watch(exchangeProductStateProvider);

  switch (state) {
    case ExchangeProductState.pro:
      {
        final proButtonProvider = ref.watch(getProductListProvider(productDay));
        return proButtonProvider;
      }

    case ExchangeProductState.searchedByName:
      {
        final searchedByNameProvider = ref.watch(getProductByNameProvider(productDay));
        return searchedByNameProvider;
      }
  }
});
