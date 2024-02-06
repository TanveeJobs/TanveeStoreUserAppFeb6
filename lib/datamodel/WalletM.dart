// To parse this JSON data, do
//
//     final walletM = walletMFromJson(jsonString);

import 'dart:convert';

WalletM walletMFromJson(String str) => WalletM.fromJson(json.decode(str));

String walletMToJson(WalletM data) => json.encode(data.toJson());

class WalletM {
  WalletM({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.walletBalance,
    this.transactionId,
    this.trasactionAmt,
    this.transactionType,
    this.orderNumber,
    this.razopayPaymentId,
    this.razopayOrderId,
    this.status,
    this.user,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? walletBalance;
  String? transactionId;
  String? trasactionAmt;
  String? transactionType;
  String? orderNumber;
  String? razopayPaymentId;
  String? razopayOrderId;
  String? status;
  int? user;

  factory WalletM.fromJson(Map<String, dynamic> json) => WalletM(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    walletBalance: json["walletBalance"],
    transactionId: json["transactionId"],
    trasactionAmt: json["trasactionAmt"],
    transactionType: json["transactionType"],
    orderNumber: json["orderNumber"],
    razopayPaymentId: json["razopayPaymentId"],
    razopayOrderId: json["razopayOrderId"],
    status: json["status"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String()??"",
    "updated_at": updatedAt?.toIso8601String()??"",
    "walletBalance": walletBalance,
    "transactionId": transactionId,
    "trasactionAmt": trasactionAmt,
    "transactionType": transactionType,
    "orderNumber": orderNumber,
    "razopayPaymentId": razopayPaymentId,
    "razopayOrderId": razopayOrderId,
    "status": status,
    "user": user,
  };
}
