// To parse this JSON data, do
//
//     final wishList = wishListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WishList wishListFromJson(String str) => WishList.fromJson(json.decode(str));

String wishListToJson(WishList data) => json.encode(data.toJson());

class WishList {
  WishList({
    required this.status,
    required this.data,
  });

  final bool status;
  final List<Datum> data;

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.productId,
    required this.productName,
    required this.shortDescription,
    required this.price,
    required this.mainImage,
  });

  final int id;
  final int productId;
  final String productName;
  final String shortDescription;
  final double price;
  final String mainImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["ProductId"],
        productName: json["ProductName"],
        shortDescription: json["ShortDescription"],
        price: json["price"],
        mainImage: json["mainImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductId": productId,
        "ProductName": productName,
        "ShortDescription": shortDescription,
        "price": price,
        "mainImage": mainImage,
      };
}
