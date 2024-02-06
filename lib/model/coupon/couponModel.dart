// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  Coupon({
    required this.count,
    required this.data,
  });

  final int count;
  final List<Datum> data;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
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
    required this.createdAt,
    required this.updatedAt,
    required this.offerCode,
    required this.validFrom,
    required this.validUpto,
    required this.discount,
    required this.maxDiscountAmt,
    required this.minOrderAmt,
    required this.isOneTimeUse,
    required this.isNewCustomer,
    required this.offerBanner,
    required this.offerShortDesc,
    required this.offerFullDesc,
    required this.offerStatus,
  });

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String offerCode;
  final DateTime validFrom;
  final DateTime validUpto;
  final String discount;
  final String maxDiscountAmt;
  final String minOrderAmt;
  final bool isOneTimeUse;
  final bool isNewCustomer;
  final String offerBanner;
  final String offerShortDesc;
  final String offerFullDesc;
  final String offerStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        offerCode: json["offer_code"],
        validFrom: DateTime.parse(json["valid_from"]),
        validUpto: DateTime.parse(json["valid_upto"]),
        discount: json["discount"],
        maxDiscountAmt: json["max_discount_amt"],
        minOrderAmt: json["min_order_amt"],
        isOneTimeUse: json["is_one_time_use"],
        isNewCustomer: json["is_new_customer"],
        offerBanner: json["offer_banner"],
        offerShortDesc: json["offer_short_desc"],
        offerFullDesc: json["offer_full_desc"],
        offerStatus: json["offer_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "offer_code": offerCode,
        "valid_from": validFrom.toIso8601String(),
        "valid_upto": validUpto.toIso8601String(),
        "discount": discount,
        "max_discount_amt": maxDiscountAmt,
        "min_order_amt": minOrderAmt,
        "is_one_time_use": isOneTimeUse,
        "is_new_customer": isNewCustomer,
        "offer_banner": offerBanner,
        "offer_short_desc": offerShortDesc,
        "offer_full_desc": offerFullDesc,
        "offer_status": offerStatus,
      };
}
