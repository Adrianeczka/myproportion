import 'dart:core';

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'diet_day.g.dart';
part 'diet_day.freezed.dart';

@freezed
class Parameters with _$Parameters {
  factory Parameters(int? categoryId, int? typeDietId) = _Parameters;
}

@JsonSerializable()
class DietDay {
  int? id;
  DateTime? date;
  @JsonKey(name: 'meals_day')
  final List<MealDay>? mealsDay;
  Diet? diet;

  DietDay({this.id, this.date, this.mealsDay, this.diet});

  factory DietDay.fromJson(Map<String, dynamic> json) =>
      _$DietDayFromJson(json);
  Map<String, dynamic> toJson() => _$DietDayToJson(this);
}

@JsonSerializable()
class Diet {
  int? type;
  Diet({this.type});

  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);
  Map<String, dynamic> toJson() => _$DietToJson(this);
}

@JsonSerializable()
class MealDay {
  int? id;
  DateTime? date;
  @JsonKey(name: 'products_day')
  final List<ProductDay>? productsDay;
  Meal? meal;
  int? index;

  MealDay({
    this.id,
    this.date,
    this.productsDay,
    this.meal,
    this.index,
  });

  factory MealDay.fromJson(Map<String, dynamic> json) =>
      _$MealDayFromJson(json);

  Map<String, dynamic> toJson() => _$MealDayToJson(this);
}

@JsonSerializable()
class ProductDay {
  @JsonKey(name: 'weight_eaten')
  int? weightEaten;
  int? id;
  DateTime? date;
  Product? product;
  int? weight;

  @JsonKey(name: 'type_change')
  int? typeChange;

  int? index;

  ProductDay({
    this.weightEaten,
    this.id,
    this.date,
    this.product,
    this.weight,
    this.typeChange,
    this.index,
  });

  factory ProductDay.fromJson(Map<String, dynamic> json) =>
      _$ProductDayFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDayToJson(this);
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  @JsonKey(name: 'name_pl')
  String? namePl;
  int? weight;
  Category? category;

  Product({this.id, this.name, this.namePl, this.weight, this.category});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Category {
  int? id;
  String? name;
  @JsonKey(name: 'name_pl')
  String? namePl;
  Category({this.id, this.name, this.namePl});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

class CategoryList {
  List<Category>? categoryList;

  CategoryList([this.categoryList]);

  factory CategoryList.fromJson(List<dynamic> json) {
    return CategoryList(json.map((e) => Category.fromJson(e)).toList());
  }
}

@JsonSerializable()
class Meal {
  int? id;
  String? name;
  @JsonKey(name: 'name_pl')
  String? namePl;
  String? description;
  @JsonKey(name: 'description_pl')
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
