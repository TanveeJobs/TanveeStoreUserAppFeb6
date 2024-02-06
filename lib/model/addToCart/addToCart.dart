import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/app_const.dart';
import 'dart:convert';

import 'package:tanvi/widgets/cart/CartM.dart';

class AddToCartProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _cartData = {};
  List<dynamic> _cartList = [];
  List<CartM> newCartList = [];

  int cartItemLenght = 0;

  // Map<String, String> _cart = {};

  Map<String, dynamic> get cartData {
    return {..._cartData};
  }

  List<dynamic> get cartList {
    return [..._cartList];
  }

  int get length {
    return newCartList.length;
  }
  double get taxCalculation {
    final taxCalculation =cartData;
   double tax = 0.0;
    for (final cartItem in taxCalculation['data']['cartItem']) {
      tax += (cartItem['totalPrice'] as num) * (cartItem['tax'] as num) / 100.0;
    }

    print('Tax: $tax');
    //double overAll = taxCalculation['data']['grandTotal'] * tax;
    return tax;
  }
  Future<void> getCartProducts() async {
    // newCartList= GetStorage().read(AppConst.cartKey)??[];
    // notifyListeners();
    // return;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/');
    print("get cart url $url");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print('Response ${response.body}');
    if (response.statusCode == 200) {
      _cartData = json.decode(response.body);
      _cartList = _cartData['data']['cartItem'];
      print('cart updated pts $cartItemLenght');
      // newCartList.clear();
      newCartList = _cartList.map((e) => CartM.fromJson(e)).toList();
      if (cartItemLenght != _cartData['data']['cartItem'].length) {
        cartItemLenght = _cartData['data']['cartItem'].length;
        notifyListeners();
      }
    } else {
      // if() {}
      _cartData = {
        'data': {'cartItem': []}
      };
      return;
    }
    // _cartData = res as Map<String, dynamic>;

    print('Cart Data: $_cartData');
    // return res;
  }

  CartM? isCartHasThisProduct(Quantity quantity) {
    CartM? item = newCartList.firstWhereOrNull((e) =>
        e.productId == quantity.product.toInt() &&
        e.sizeId == quantity.id.toInt());
    return item;
  }

  dynamic postToCart(
      {required int productId,
      required int quantity,
      int? sizeId,
      bool isAdd = false}) async {
    if (sizeId == null) {
      Fluttertoast.showToast(msg: "Size Id is required");
      return;
    }
    var cartItem =
        CartM(productId: productId, quantity: quantity, sizeId: sizeId, id: 0);
    var existList = newCartList.where((element) =>
        element.productId == productId && element.sizeId == sizeId);
    if (existList.isEmpty) {
      newCartList.add(cartItem);
    } else {
      existList.first.quantity += 1;
    }

    //GetStorage().write(AppConst.cartKey, newCartList);

    print('productId $productId');
    print('quantity $quantity');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var data = {'product': productId, 'quantity': quantity};

    // var json2 = cartItem.toJson();
    // var body2 = json2.map((key, value) => MapEntry(key, value.toString()));
    Map<String, String> map = Map();
    map["product"] = cartItem.productId.toString();
    map["sizeId"] = cartItem.sizeId.toString();
    map["quantity"] = quantity.toString();
    map["id"] = "null";
    var response;
    if (quantity == 0) {
      map.addAll({"cartId": "nun", "product": cartItem.productId.toString()});
      print("Cart Body ${json.encode(map)}");
      final url = Uri.parse(baseUrl + 'api/add-to-cart/');
      print("delete ${url}");
      response = await http.delete(url, body: map, headers: {
        'Authorization': 'Bearer ${localStorage.getString('token')}',
      });
    } else {
      final url = Uri.parse(baseUrl + 'api/add-to-cart/');
      print("Cart Body ${json.encode(map)}");
      print("postx ${url}");
      response = await http.post(url, body: map, headers: {
        'Authorization': 'Bearer ${localStorage.getString('token')}',
      });
    }
    print("Cart response ${response.body}");
    // print('Lengthhhhhhhhhhhhhhhhhhhhhhhh Of Cart: $cartItemLenght');
    // cartItemLenght = length;
    notifyListeners();
    getCartProducts();
    return response;
  }

  Future<Map<String, dynamic>> editCartItem({
 required CartM cartM
  }) async {
    // print(productId);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/${cartM.id}/');
    print("Put ${url}");
    var body = {
      "product": "${cartM.productId}",
      // "product": "${cartM.id}",
      "cartId": "${cartM.id}",
      // "cartId": "${cartM.productId}",
      "sizeId": "${cartM.sizeId}",
      "quantity":"${cartM.quantity}"

    };
    print("Body ${json.encode(body)}");
    final response = await http.put(url, body: body, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    });
    var res = json.decode(response.body);
    print('Edit Cart Item $res');
    notifyListeners();
    return res;
  }

  Future<void> deleteCartItem(
      {required int cartId,
      required int productId,
      required int sizeId}) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/$cartId/');
    // final url = Uri.parse(baseUrl + 'api/add-to-cart/');

    var body = {
      "product": "$productId",
      "sizeId": "$sizeId",
      "cartId": "$cartId"
    };
    var jsonData = jsonEncode(body);
    print("deleted Body ${jsonData}");

    var request = http.MultipartRequest(
      'DELETE',
      url,
    );
    request.fields.addAll(body);
    request.headers.addAll({
      // 'Content-Type': 'application/json',
      // 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    http.StreamedResponse response = await request.send();
    print('Delete Response: ${await response.stream.bytesToString()}');

/*    final response = await http.delete(url,body: body, headers: {
      // 'Content-Type': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    print("Url ${url}");
    // print('Delete Response: ${response.body}');*/
    // cartItemLenght-=1;
    notifyListeners();
    getCartProducts();
  }
}
