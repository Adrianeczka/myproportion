import 'package:json_annotation/json_annotation.dart';

import 'diet_day.dart';
part 'proposed_product.g.dart';

@JsonSerializable()
class ProductList {
  List<Product>? productList;

  ProductList([this.productList]);

  factory ProductList.fromJson(List<dynamic> json) {
    return ProductList(json.map((e) => Product.fromJson(e)).toList());
  }
}
