class DietDay {
  int? id;
  DateTime? date;
  List<MealDay>? mealsDay;

  DietDay({
    this.id,
    this.date,
    this.mealsDay,
  });

  factory DietDay.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['meals_day'] as List;

    List<MealDay> mealsDayList = list.map((i) => MealDay.fromJson(i)).toList();

    return DietDay(
      id: parsedJson['id'] ? parsedJson['id'] : null,
      date: DateTime.parse(parsedJson['date']),
      mealsDay: mealsDayList,
    );
  }
}

class MealDay {
  final int id;
  final DateTime date;
  final List<ProductsDay> productsDay;
  // final Meal meal;
  final int index;

  MealDay({
    required this.id,
    required this.date,
    required this.productsDay,
    // required this.meal,
    required this.index,
  });
  factory MealDay.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['products_day'] as List;

    List<ProductsDay> productsDayList =
        list.map((i) => ProductsDay.fromJson(i)).toList();

    return MealDay(
      id: parsedJson['id'],
      date: DateTime.parse(parsedJson['date']),
      productsDay: productsDayList,
      // meal: parsedJson['meal'],
      index: parsedJson['index'],
    );
  }
}

class ProductsDay {
  final int weightEaten;
  final int id;
  final DateTime date;
  // final Product product;
  final int weight;
  final int typeChange;
  final int index;

  ProductsDay({
    required this.weightEaten,
    required this.id,
    required this.date,
    // required this.product,
    required this.weight,
    required this.typeChange,
    required this.index,
  });
  factory ProductsDay.fromJson(Map<String, dynamic> parsedJson) {
    return ProductsDay(
      weightEaten: parsedJson['weight_eaten'],
      id: parsedJson['id'],
      date: DateTime.parse(parsedJson['date']),
      // product: parsedJson['product'],
      weight: parsedJson['weight'],
      typeChange: parsedJson['type_change'],
      index: parsedJson['index'],
    );
  }
}

enum Date { THE_20210408_T00_00000200 }

class Diet {
  final int id;
  final String name;
  final int weightFrom;
  final int weightTo;
  final int gender;
  final int mass;
  final int type;
  final List<DietProduct> dietProducts;

  Diet({
    required this.id,
    required this.name,
    required this.weightFrom,
    required this.weightTo,
    required this.gender,
    required this.mass,
    required this.type,
    required this.dietProducts,
  });

  factory Diet.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['diet_product'] as List;

    List<DietProduct> dietProductsList =
        list.map((i) => DietProduct.fromJson(i)).toList();

    return Diet(
      id: parsedJson['id'],
      name: parsedJson['name'],
      weightFrom: parsedJson['weight_from'],
      weightTo: parsedJson['weight_to'],
      gender: parsedJson['gender'],
      mass: parsedJson['mass'],
      type: parsedJson['type'],
      dietProducts: dietProductsList,
    );
  }
}

class DietProduct {
  final int id;
  // final Product product;
  final int weight;
  final int index;
  final int typeChange;

  DietProduct({
    required this.id,
    // required this.product,
    required this.weight,
    required this.index,
    required this.typeChange,
  });

  factory DietProduct.fromJson(Map<String, dynamic> parsedJson) {
    return DietProduct(
      id: parsedJson['id'],
      // product: parsedJson['image_name'],
      weight: parsedJson['weight'],
      index: parsedJson['index'],
      typeChange: parsedJson['type_change'],
    );
  }
}

class Product {
  final int id;
  final String name;
  final String namePl;
  final int weight;

  Product({
    required this.id,
    required this.name,
    required this.namePl,
    required this.weight,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      namePl: json['name_pl'],
      weight: json['weight'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String namePl;

  Category({
    required this.id,
    required this.name,
    required this.namePl,
  });
  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      id: parsedJson['id'],
      name: parsedJson['name'],
      namePl: parsedJson['name_pl'],
    );
  }
}

class Variant {
  final String name;
  final bool type;
  final int portionWeight;
  final int weight;
  final int kcal;

  Variant({
    required this.name,
    required this.type,
    required this.portionWeight,
    required this.weight,
    required this.kcal,
  });
  factory Variant.fromJson(Map<String, dynamic> parsedJson) {
    return Variant(
      name: parsedJson['name'],
      type: parsedJson['type'],
      portionWeight: parsedJson['portion_weight'],
      weight: parsedJson['weight'],
      kcal: parsedJson['kcal'],
    );
  }
}

class Meal {
  final int id;
  final String name;
  final String namePl;
  final String description;
  final String descriptionPl;
  final int category;
  final int index;

  Meal({
    required this.id,
    required this.name,
    required this.namePl,
    required this.description,
    required this.descriptionPl,
    required this.category,
    required this.index,
  });
  factory Meal.fromJson(Map<String, dynamic> parsedJson) {
    return Meal(
      id: parsedJson['id'],
      name: parsedJson['name'],
      namePl: parsedJson['name_pl'],
      description: parsedJson['description'],
      descriptionPl: parsedJson['description_pl'],
      category: parsedJson['category'],
      index: parsedJson['index'],
    );
  }
}
