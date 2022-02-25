import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/diet_day.dart';

import '../models/http_exception.dart';

final getCategoriesProvider =
    FutureProvider.family<CategoryList, Parameters>((ref, parameters) async {
  final response = await http.get(
    Uri.parse(
        'https://api.myproportion.com/api/v1/category-by-category/${parameters.categoryId}/${parameters.typeDietId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${Constants.authToken}',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> categoryList = jsonDecode(response.body);
    return CategoryList.fromJson(categoryList);
  } else if (response.statusCode == 204) {
    return CategoryList();
  } else {
    throw HttpException('List of categorie\'s cannot be rendered');
  }
});
