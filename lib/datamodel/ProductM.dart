// To parse this JSON data, do
//
//     final productM = productMFromJson(jsonString);

import 'dart:convert';

ProductM productMFromJson(String str) => ProductM.fromJson(json.decode(str));

String productMToJson(ProductM data) => json.encode(data.toJson());

class ProductM {
  ProductM(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.shortDescription,
      this.description,
      this.status,
      this.weight,
      this.qty,
      this.price,
      this.discountPrice,
      this.offer_price,
      this.tax,
      this.mainImage,
      this.softDelete,
      this.category,
      this.sizes,
      this.brandName,
      this.uom,
      // this.vendor,
      this.quantities = const []});

  num? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? shortDescription;
  String? description;
  String? status;
  String? weight;
  num? qty;
  num? price;
  num? discountPrice;
  num? offer_price;
  dynamic tax;
  dynamic? mainImage;
  bool? softDelete;
  Category? category;
  BrandName? sizes;
  BrandName? brandName;
  BrandName? uom;
  List<Quantity> quantities;
  Quantity? selectedQuantity;

  List<Quantity> get getQuantities => quantities.isNotEmpty
      ? quantities
      : [
          Quantity(
            id: 0,
            weight: "0",
            price: price??1,
            uom: Uom(id: 1, name: "No Uom", shortName: "shortName"),
            discountPrice: discountPrice??price??1,
            product: 0,
            offerPrice: offer_price??1,
            qty: 1
          )
        ];

  // List<Quantity> get getQuantities=>quantities;
  Quantity get getSelectedQuantity => selectedQuantity ?? getQuantities.first;

  // Vendor vendor;

  get getDiscountedPrice => offer_price ?? discountPrice;

  get discountPercentage =>
      (100 - (getDiscountedPrice! / price!) * 100).roundToDouble().toInt();

  factory ProductM.fromJson(Map<String, dynamic> json) => ProductM(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        weight: json["weight"] == null ? null : json["weight"],
        qty: json["qty"] == null ? null : json["qty"],
        price: json["price"] == null ? null : json["price"],
        discountPrice:
            json["discount_price"] == null ? null : json["discount_price"],
        offer_price: json["offer_price"] == null ? null : json["offer_price"],
        tax: json["tax"] == null ? null : json["tax"],
        mainImage: json["main_image"],
        softDelete: json["soft_delete"] == null ? null : json["soft_delete"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        sizes: json["sizes"] == null ? null : BrandName.fromJson(json["sizes"]),
        brandName: json["brand_name"] == null
            ? null
            : BrandName.fromJson(json["brand_name"]),
        uom: json["uom"] == null ? null : BrandName.fromJson(json["uom"]),
        // vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        quantities: json["quantities"] != null
            ? List<Quantity>.from(
                json["quantities"].map((x) => Quantity.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "name": name == null ? null : name,
        "short_description": shortDescription == null ? null : shortDescription,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "weight": weight == null ? null : weight,
        "qty": qty == null ? null : qty,
        "price": price == null ? null : price,
        "discount_price": discountPrice == null ? null : discountPrice,
        "offer_price": offer_price == null ? null : offer_price,
        "tax": tax == null ? null : tax,
        "main_image": mainImage,
        "soft_delete": softDelete == null ? null : softDelete,
        "category": category == null ? null : category?.toJson(),
        "sizes": sizes == null ? null : sizes?.toJson(),
        "brand_name": brandName == null ? null : brandName?.toJson(),
        "uom": uom == null ? null : uom?.toJson(),
        // "vendor": vendor == null ? null : vendor.toJson(),
        "quantities": List<dynamic>.from(quantities.map((x) => x.toJson())),
      };
}

class BrandName {
  BrandName({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.size,
    this.shortName,
  });

  num? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? size;
  String? shortName;

  factory BrandName.fromJson(Map<String, dynamic> json) => BrandName(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
        size: json["size"] == null ? null : json["size"],
        shortName: json["short_name"] == null ? null : json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "name": name == null ? null : name,
        "size": size == null ? null : size,
        "short_name": shortName == null ? null : shortName,
      };
}

class Category {
  Category({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.categoryImage,
    this.active,
  });

  num? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? categoryImage;
  bool? active;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
        categoryImage:
            json["categoryImage"] == null ? null : json["categoryImage"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "name": name == null ? null : name,
        "categoryImage": categoryImage == null ? null : categoryImage,
        "active": active == null ? null : active,
      };
}

class Vendor {
  Vendor({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orgName,
    this.telephone1,
    this.telephone2,
    this.companyPancard,
    this.companyPancardDoc,
    this.adharUdyamUdoyog,
    this.adharUdyamUdoyogDoc,
    this.gstNumber,
    this.status,
    this.distance,
    this.deliveringPincodes,
    this.user,
  });

  num? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orgName;
  String? telephone1;
  String? telephone2;
  dynamic companyPancard;
  dynamic companyPancardDoc;
  dynamic adharUdyamUdoyog;
  dynamic adharUdyamUdoyogDoc;
  dynamic gstNumber;
  String? status;
  num? distance;
  String? deliveringPincodes;
  num? user;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        orgName: json["org_name"] == null ? null : json["org_name"],
        telephone1: json["telephone_1"] == null ? null : json["telephone_1"],
        telephone2: json["telephone_2"] == null ? null : json["telephone_2"],
        companyPancard: json["company_pancard"],
        companyPancardDoc: json["company_pancard_doc"],
        adharUdyamUdoyog: json["adhar_udyam_udoyog"],
        adharUdyamUdoyogDoc: json["adhar_udyam_udoyog_doc"],
        gstNumber: json["gst_number"],
        status: json["status"] == null ? null : json["status"],
        distance: json["distance"] == null ? null : json["distance"],
        deliveringPincodes: json["delivering_pincodes"] == null
            ? null
            : json["delivering_pincodes"],
        user: json["user"] == null ? null : json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "org_name": orgName == null ? null : orgName,
        "telephone_1": telephone1 == null ? null : telephone1,
        "telephone_2": telephone2 == null ? null : telephone2,
        "company_pancard": companyPancard,
        "company_pancard_doc": companyPancardDoc,
        "adhar_udyam_udoyog": adharUdyamUdoyog,
        "adhar_udyam_udoyog_doc": adharUdyamUdoyogDoc,
        "gst_number": gstNumber,
        "status": status == null ? null : status,
        "distance": distance == null ? null : distance,
        "delivering_pincodes":
            deliveringPincodes == null ? null : deliveringPincodes,
        "user": user == null ? null : user,
      };
}

Quantity quantityFromJson(String str) => Quantity.fromJson(json.decode(str));

String quantityToJson(Quantity data) => json.encode(data.toJson());

class Quantity {
  Quantity({
    required this.id,
    this.uom,
    // required this.createdAt,
    // required this.updatedAt,
    required this.weight,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.product,
    this.offerPrice,
  });

  num id;
  Uom? uom;
  get getDiscountedPrice => offerPrice ?? price;
  get discountPercentage =>
      (100 - (getDiscountedPrice! / price) * 100).roundToDouble().toInt();
  get getOfferPrice=>price-discountPrice;

  // DateTime createdAt;
  // DateTime updatedAt;
  String weight;
  int qty;
  num price;
  num discountPrice;
  num product;
  num? offerPrice;
  String get getDisplayString=>"${weight} ${uom?.shortName}";


  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"],
        uom: json["uom"]!=null?Uom.fromJson(json["uom"]):null,
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        weight: json["weight"],
        qty: json["qty"]??0,
        price: json["price"],
        discountPrice: json["discount_price"]??json["price"],
        product: json["product"]??0,
        offerPrice: json["offer_price"]??json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uom": uom?.toJson(),
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        "weight": weight,
        "qty": qty,
        "price": price,
        "discount_price": discountPrice,
        "product": product,
        "offer_price": offerPrice,
      };
  @override
  String toString() {
    // TODO: implement toString
    return weight;
  }
}

class Uom {
  Uom({
    required this.id,
    required this.name,
    required this.shortName,
  });

  int id;
  String name;
  String shortName;

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
