// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Datum> data;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.postcode,
    required this.addressLine,
    required this.locality,
    required this.city,
    required this.state,
    required this.saveAddressAs,
    required this.isDefault,
    required this.user,
  });

  final int id;
  final String name;
  final String contactNumber;
  final String postcode;
  final String addressLine;
  final String locality;
  final String city;
  final String state;
  final String saveAddressAs;
  final bool isDefault;
  final int user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        contactNumber: json["contact_number"],
        postcode: json["postcode"],
        addressLine: json["address_line"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        saveAddressAs: json["save_address_as"],
        isDefault: json["is_default"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact_number": contactNumber,
        "postcode": postcode,
        "address_line": addressLine,
        "locality": locality,
        "city": city,
        "state": state,
        "save_address_as": saveAddressAs,
        "is_default": isDefault,
        "user": user,
      };
}
