// To parse this JSON data, do
//
//     final categoryProducts = categoryProductsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryProducts categoryProductsFromJson(String str) =>
    CategoryProducts.fromJson(json.decode(str));

String categoryProductsToJson(CategoryProducts data) =>
    json.encode(data.toJson());

class CategoryProducts {
  CategoryProducts({
    required this.count,
    required this.data,
  });

  final int count;
  final List<Datum> data;

  factory CategoryProducts.fromJson(Map<String, dynamic> json) =>
      CategoryProducts(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.category,
    required this.brandName,
    required this.uom,
    required this.sizes,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.status,
    required this.price,
    required this.tax,
    required this.mainImage,
  });

  final int id;
  final Category category;
  final BrandName brandName;
  final Uom uom;
  final Sizes sizes;
  final String name;
  final String shortDescription;
  final String description;
  final String status;
  final double price;
  final String tax;
  final String mainImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        brandName: BrandName.fromJson(json["brand_name"]),
        uom: Uom.fromJson(json["uom"]),
        sizes: Sizes.fromJson(json["sizes"]),
        name: json["name"],
        shortDescription: json["short_description"],
        description: json["description"],
        status: json["status"],
        price: json["price"],
        tax: json["tax"],
        mainImage: json["main_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category.toJson(),
        "brand_name": brandName.toJson(),
        "uom": uom.toJson(),
        "sizes": sizes.toJson(),
        "name": name,
        "short_description": shortDescription,
        "description": description,
        "status": status,
        "price": price,
        "tax": tax,
        "main_image": mainImage,
      };
}

class BrandName {
  BrandName({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory BrandName.fromJson(Map<String, dynamic> json) => BrandName(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.active,
  });

  final int id;
  final String name;
  final String categoryImage;
  final bool active;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        categoryImage: json["categoryImage"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryImage": categoryImage,
        "active": active,
      };
}

class Sizes {
  Sizes({
    required this.id,
    required this.size,
  });

  final int id;
  final String size;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        id: json["id"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
      };
}

class Uom {
  Uom({
    required this.id,
    required this.name,
    required this.shortName,
  });

  final int id;
  final String name;
  final String shortName;

  factory Uom.fromJson(Map<String, dynamic> json) => Uom(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
      };
}
