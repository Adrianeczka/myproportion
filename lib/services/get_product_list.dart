import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_proportion/models/diet_day.dart';

import '../constants.dart';
import '../models/http_exception.dart';
import '../models/proposed_product.dart';

final getProductListProvider = FutureProvider.family<ProductList, ProductDay>((ref, productDay) async {
  final response = await http.get(
    Uri.parse('https://test-api.myproportion.com/api/v1/products-diet-day-by-similar/${productDay.id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Constants.authToken}',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> proposedProductList = jsonDecode(response.body);
    return ProductList.fromJson(proposedProductList);
  } else if (response.statusCode == 204) {
    return ProductList();
  } else {
    throw HttpException('List of product\'s cannot be rendered');
  }
});
