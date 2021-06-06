// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietDay _$DietDayFromJson(Map<String, dynamic> json) {
  return DietDay(
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    mealsDay: (json['meals_day'] as List<dynamic>?)
        ?.map((e) => MealDay.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DietDayToJson(DietDay instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'meals_day': instance.mealsDay,
    };

MealDay _$MealDayFromJson(Map<String, dynamic> json) {
  return MealDay(
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    productsDay: (json['products_day'] as List<dynamic>?)
        ?.map((e) => ProductsDay.fromJson(e as Map<String, dynamic>))
        .toList(),
    index: json['index'] as int?,
  )..meal = json['meal'] == null
      ? null
      : Meal.fromJson(json['meal'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MealDayToJson(MealDay instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'products_day': instance.productsDay,
      'meal': instance.meal,
      'index': instance.index,
    };

ProductsDay _$ProductsDayFromJson(Map<String, dynamic> json) {
  return ProductsDay(
    weightEaten: json['weightEaten'] as int?,
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    typeChange: json['typeChange'] as int?,
    index: json['index'] as int?,
  );
}

Map<String, dynamic> _$ProductsDayToJson(ProductsDay instance) =>
    <String, dynamic>{
      'weightEaten': instance.weightEaten,
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'typeChange': instance.typeChange,
      'index': instance.index,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['namePl'] as String?,
    weight: json['weight'] as int?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'namePl': instance.namePl,
      'weight': instance.weight,
    };

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['namePl'] as String?,
    description: json['description'] as String?,
    descriptionPl: json['descriptionPl'] as String?,
    category: json['category'] as int?,
    index: json['index'] as int?,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'namePl': instance.namePl,
      'description': instance.description,
      'descriptionPl': instance.descriptionPl,
      'category': instance.category,
      'index': instance.index,
    };
