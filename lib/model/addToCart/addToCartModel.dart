// To parse this JSON data, do
//
//     final addToCartData = addToCartDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddToCartData addToCartDataFromJson(String str) =>
    AddToCartData.fromJson(json.decode(str));

String addToCartDataToJson(AddToCartData data) => json.encode(data.toJson());

class AddToCartData {
  AddToCartData({
    required this.data,
  });

  final Data data;

  factory AddToCartData.fromJson(Map<String, dynamic> json) => AddToCartData(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.cartItem,
    required this.grandTotal,
  });

  final List<CartItem> cartItem;
  final int grandTotal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItem: List<CartItem>.from(
            json["cartItem"].map((x) => CartItem.fromJson(x))),
        grandTotal: json["grandTotal"],
      );

  Map<String, dynamic> toJson() => {
        "cartItem": List<dynamic>.from(cartItem.map((x) => x.toJson())),
        "grandTotal": grandTotal,
      };
}

class CartItem {
  CartItem({
    required this.id,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.mainImage,
    required this.totalPrice,
  });

  final int id;
  final String productName;
  final int price;
  final int quantity;
  final String mainImage;
  final int totalPrice;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
        mainImage: json["mainImage"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "quantity": quantity,
        "mainImage": mainImage,
        "totalPrice": totalPrice,
      };
}
