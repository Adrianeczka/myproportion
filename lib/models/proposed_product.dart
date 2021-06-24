import 'package:json_annotation/json_annotation.dart';
part 'proposed_product.g.dart';

@JsonSerializable()
class ProposedProduct {
  int? id;
  String? name;
  @JsonKey(name: 'name_pl')
  String? namePl;
  @JsonKey(name: 'portion_name')
  String? portionName;
  int? weight;

  ProposedProduct({
    this.id,
    this.name,
    this.namePl,
    this.portionName,
    this.weight,
  });

  factory ProposedProduct.fromJson(Map<String, dynamic> json) =>
      _$ProposedProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProposedProductToJson(this);
}

class ProposedProductList {
  List<ProposedProduct>? proposedProductList;

  ProposedProductList([this.proposedProductList]);

  factory ProposedProductList.fromJson(List<dynamic> json) {
    return ProposedProductList(
        json.map((e) => ProposedProduct.fromJson(e)).toList());
  }
}
