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
    diet: json['diet'] == null
        ? null
        : Diet.fromJson(json['diet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DietDayToJson(DietDay instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'meals_day': instance.mealsDay,
      'diet': instance.diet,
    };

Diet _$DietFromJson(Map<String, dynamic> json) {
  return Diet(
    type: json['type'] as int?,
  );
}

Map<String, dynamic> _$DietToJson(Diet instance) => <String, dynamic>{
      'type': instance.type,
    };

MealDay _$MealDayFromJson(Map<String, dynamic> json) {
  return MealDay(
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    productsDay: (json['products_day'] as List<dynamic>?)
        ?.map((e) => ProductDay.fromJson(e as Map<String, dynamic>))
        .toList(),
    meal: json['meal'] == null
        ? null
        : Meal.fromJson(json['meal'] as Map<String, dynamic>),
    index: json['index'] as int?,
  );
}

Map<String, dynamic> _$MealDayToJson(MealDay instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'products_day': instance.productsDay,
      'meal': instance.meal,
      'index': instance.index,
    };

ProductDay _$ProductDayFromJson(Map<String, dynamic> json) {
  return ProductDay(
    weightEaten: json['weight_eaten'] as int?,
    id: json['id'] as int?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    weight: json['weight'] as int?,
    typeChange: json['type_change'] as int?,
    index: json['index'] as int?,
  );
}

Map<String, dynamic> _$ProductDayToJson(ProductDay instance) =>
    <String, dynamic>{
      'weight_eaten': instance.weightEaten,
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'product': instance.product,
      'weight': instance.weight,
      'type_change': instance.typeChange,
      'index': instance.index,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['name_pl'] as String?,
    weight: json['weight'] as int?,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_pl': instance.namePl,
      'weight': instance.weight,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['name_pl'] as String?,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_pl': instance.namePl,
    };

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    id: json['id'] as int?,
    name: json['name'] as String?,
    namePl: json['name_pl'] as String?,
    description: json['description'] as String?,
    descriptionPl: json['description_pl'] as String?,
    category: json['category'] as int?,
    index: json['index'] as int?,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_pl': instance.namePl,
      'description': instance.description,
      'description_pl': instance.descriptionPl,
      'category': instance.category,
      'index': instance.index,
    };
