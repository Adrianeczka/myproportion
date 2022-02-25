import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/models/diet_day.dart';
import '../constants.dart';
import '../models/http_exception.dart';
import '../models/proposed_product.dart';
import '../widgets/exchange_box.dart';

final getProductByNameProvider = FutureProvider.family<ProductList, ProductDay>((ref, productDay) async {
  final String searchedProduct = ref.watch(searchProductProvider);

  final response = await http.post(
    Uri.parse('https://test-api.myproportion.com/api/v1/products-diet-day-by-search/${productDay.id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Constants.authToken}',
    },
    body: jsonEncode(<String, String>{'language': 'pl', 'search': searchedProduct}),
  );
  if (response.statusCode == 200) {
    List<dynamic> productList = jsonDecode(response.body);
    return ProductList.fromJson(productList);
  } else if (response.statusCode == 204) {
    return ProductList();
  } else {
    throw HttpException('get product to exchange is impossible.');
  }
});
