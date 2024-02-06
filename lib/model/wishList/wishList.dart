import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/util/app_const.dart';
import './wishListModel.dart';

class WishListProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _wishList = {};

  Map<String, dynamic> get wishList {
    return {..._wishList};
  }

  Future<void> wishListAdd(int productId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/wishlist/');
    final response = await http.post(url, body: {
      'product': productId.toString(),
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    debugPrint("Wish List ${response.body}");
  }

  Future<void> fetchProducts() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/wishlist/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    WishList wishListProducts = wishListFromJson(response.body);
    _wishList = wishListProducts.toJson();
    print("Wish List$_wishList");
  }

  Future<void> deleteItem(int wishListId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/wishlist-delete/$wishListId/');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    print(response.body);
  }

  Future<void> wishListToCart(
      int wishListId, int productId, int quantity) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/wishlist-cart/');
    final response = await http.post(url, body: {
      'wishlist': wishListId.toString(),
      'product': productId.toString(),
      'quantity': quantity.toString()
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    print(response.body);
  }
}
