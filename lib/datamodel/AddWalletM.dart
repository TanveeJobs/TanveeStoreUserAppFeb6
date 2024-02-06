// To parse this JSON data, do
//
//     final addWalletM = addWalletMFromJson(jsonString);

import 'dart:convert';

AddWalletM? addWalletMFromJson(String str) => AddWalletM.fromJson(json.decode(str));

String addWalletMToJson(AddWalletM? data) => json.encode(data!.toJson());

class AddWalletM {
  AddWalletM({
    this.status,
    this.message,
    this.orderAmount,
    this.data,
    this.transactionNumber,
  });

  String? status;
  String? message;
  double? orderAmount;
  Data? data;
  String? transactionNumber;

  factory AddWalletM.fromJson(Map<String, dynamic> json) => AddWalletM(
    status: json["status"],
    message: json["message"],
    orderAmount: json["orderAmount"],
    data: Data.fromJson(json["data"]),
    transactionNumber: json["transactionNumber"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "orderAmount": orderAmount,
    "data": data!.toJson(),
    "transactionNumber": transactionNumber,
  };
}

class Data {
  Data({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  int? attempts;
  List<dynamic>? notes;
  int? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    entity: json["entity"],
    amount: json["amount"],
    amountPaid: json["amount_paid"],
    amountDue: json["amount_due"],
    currency: json["currency"],
    receipt: json["receipt"],
    offerId: json["offer_id"],
    status: json["status"],
    attempts: json["attempts"],
    notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entity": entity,
    "amount": amount,
    "amount_paid": amountPaid,
    "amount_due": amountDue,
    "currency": currency,
    "receipt": receipt,
    "offer_id": offerId,
    "status": status,
    "attempts": attempts,
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
    "created_at": createdAt,
  };
}
