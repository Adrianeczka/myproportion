import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/services/get_categories.dart';

import '../models/diet_day.dart';
import '../widgets/exchange_box.dart';
import '../services/get_proposed_product.dart';
import '../services/get_product_by_name.dart';
import '../models/proposed_product.dart';

enum ExchangeProductState {
  searchedByName,
  // searchedByCategory,
  // similar,
  pro,
  // good, medium,
}

final exchangeProductProvider = Provider.autoDispose
    .family<AsyncValue<ProposedProductList>?, ProductDay>((ref, productDay) {
  final state = ref.watch(exchangeProductStateProvider).state;

  final searchedByNameProvider =
      ref.watch(getProductByNameProvider(productDay.id!));

  final proButtonProvider =
      ref.watch(getProposedProductProvider(productDay.product!.id!));

  switch (state) {
    case ExchangeProductState.pro:
      return proButtonProvider;

    case ExchangeProductState.searchedByName:
      return searchedByNameProvider;
  }
});
