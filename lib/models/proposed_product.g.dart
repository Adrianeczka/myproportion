// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposed_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposedProduct _$ProposedProductFromJson(Map<String, dynamic> json) {
  return ProposedProduct(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['name_pl'] as String?,
    portionName: json['portion_name'] as String?,
    typeChange: json['type_change'] as int?,
    weight: json['weight'] as int?,
  );
}

Map<String, dynamic> _$ProposedProductToJson(ProposedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_pl': instance.namePl,
      'portion_name': instance.portionName,
      'type_change': instance.typeChange,
      'weight': instance.weight,
    };
