import 'package:json_annotation/json_annotation.dart';
import 'dart:core';
part 'diet_day.g.dart';

@JsonSerializable()
class DietDay {
  int? id;
  DateTime? date;

  @JsonKey(name: 'meals_day')
  final List<MealDay>? mealsDay;

  DietDay({this.id, this.date, this.mealsDay});

  factory DietDay.fromJson(Map<String, dynamic> json) =>
      _$DietDayFromJson(json);
  Map<String, dynamic> toJson() => _$DietDayToJson(this);
}

@JsonSerializable()
class MealDay {
  int? id;
  DateTime? date;

  @JsonKey(name: 'products_day')
  final List<ProductsDay>? productsDay;

  Meal? meal;
  int? index;

  MealDay({
    this.id,
    this.date,
    this.productsDay,
    // this.meal,
    this.index,
  });

  factory MealDay.fromJson(Map<String, dynamic> json) =>
      _$MealDayFromJson(json);

  Map<String, dynamic> toJson() => _$MealDayToJson(this);
}

@JsonSerializable()
class ProductsDay {
  int? weightEaten;

  int? id;
  DateTime? date;
  // Product? product;
  @JsonKey(ignore: true)
  int? weight;

  int? typeChange;
  int? index;

  ProductsDay({
    this.weightEaten,
    this.id,
    this.date,
    // this.product,
    this.weight,
    this.typeChange,
    this.index,
  });

  factory ProductsDay.fromJson(Map<String, dynamic> json) =>
      _$ProductsDayFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDayToJson(this);
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? namePl;
  int? weight;

  Product({
    this.id,
    this.name,
    this.namePl,
    this.weight,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Meal {
  int? id;
  String? name;
  String? namePl;
  String? description;
  String? descriptionPl;
  int? category;
  int? index;

  Meal({
    this.id,
    this.name,
    this.namePl,
    this.description,
    this.descriptionPl,
    this.category,
    this.index,
  });
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
