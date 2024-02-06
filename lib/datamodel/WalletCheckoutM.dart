// To parse this JSON data, do
//
//     final walletCheckoutM = walletCheckoutMFromJson(jsonString);

import 'dart:convert';

WalletCheckoutM walletCheckoutMFromJson(String str) => WalletCheckoutM.fromJson(json.decode(str));

String walletCheckoutMToJson(WalletCheckoutM data) => json.encode(data.toJson());

class WalletCheckoutM {
  WalletCheckoutM({
    required this.status,
    required this.message,
    required this.data,
    required this.orderAmount,
  });

  String status;
  String message;
  Data data;
  double orderAmount;

  factory WalletCheckoutM.fromJson(Map<String, dynamic> json) => WalletCheckoutM(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    orderAmount: json["OrderAmount"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "OrderAmount": orderAmount,
  };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.walletBalance,
    required this.transactionId,
    required this.trasactionAmt,
    required this.transactionType,
    required this.orderNumber,
    required this.razopayPaymentId,
    required this.razopayOrderId,
    required this.status,
    required this.user,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String walletBalance;
  String transactionId;
  String trasactionAmt;
  String transactionType;
  String orderNumber;
  String razopayPaymentId;
  String razopayOrderId;
  String status;
  int user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
