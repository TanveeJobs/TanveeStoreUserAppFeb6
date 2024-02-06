import 'dart:convert';

CartM cartMFromJson(String str) => CartM.fromJson(json.decode(str));

String cartMToJson(CartM data) => json.encode(data.toJson());

class CartM {
  CartM({
    required this.id,
    this.productName,
    this.weight,
    this.uom1,
    this.price,
    this.discountPrice,
    this.tax,
   required this.quantity,
    this.mainImage,
    this.totalPrice,
   required this.sizeId,
   required this.productId
  });

  int productId;
  int id;
  int sizeId;
  int quantity;
  String? productName;
  String? weight;
  String? uom1;
  double? price;
  double? discountPrice;
  double? tax;
  String? mainImage;
  double? totalPrice;
  String get getDisplayText=>"$weight $uom1";

  // Quantity get getSelectedQuantity => selectedQuantity ?? getQuantities.first;

  // Vendor vendor;

  get getDiscountedPrice =>  discountPrice;

  get discountPercentage =>
      (100 - (getDiscountedPrice! / price!) * 100).roundToDouble().toInt();

  factory CartM.fromJson(Map<String, dynamic> json) => CartM(
    id: json["id"],
    productName: json["productName"],
    weight: json["weight"],
    uom1: json["uom1"],
    price: json["price"],
    discountPrice: json["discount_price"],
    tax: json["tax"],
    quantity: json["quantity"],
    mainImage: json["mainImage"],
    totalPrice: json["totalPrice"],
    sizeId: json["sizeId"],
    productId: json["productId"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "weight": weight,
    "uom1": uom1,
    "price": price,
    "discount_price": discountPrice,
    "tax": tax,
    "quantity": quantity,
    "mainImage": mainImage,
    "totalPrice": totalPrice,
    "sizeId": sizeId,
    "productId": productId,
  };
}
