import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://test-api.myproportion.com/api/v1/public/diet-for-ada';
    try {
      final response = await http.get(url);
      // print(json.decode(response.body));
      // String data = response.body;
      // var mealsDay = jsonDecode(data)['meals_day'][0]['products_day'][0]
      //     ['product']['name_pl'];
      // var weight =
      //     jsonDecode(data)['meals_day'][0]['products_day'][0]['weight'];
      // print(mealsDay);
      // print(weight);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((key, value) {
        loadedProducts.add(Product(
            id: value['id'],
            productName: value['meals_day'][0]['products_day'][0]['product']
                ['name_pl'],
            weight: value['meals_day'][0]['products_day'][0]['weight']));
      });

      _items = loadedProducts;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
