import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/util/app_const.dart';

class ProductsProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _products = {};
  Map<String, dynamic> _search = {};
  Map<String, dynamic> _productsTest = {};
  List<dynamic> _searchProducts = [];

  Map<String, dynamic> get products {
    return {..._products};
  }

  List<dynamic> get searchProducts {
    return [..._searchProducts];
  }

  Future<void> getProducts() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/products');
    print("Url ${url}");
    final response = await http.get(url, headers: {
      // 'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print('Products: ${response.body}');
    _products = json.decode(response.body);
  }

  //
  Future<void> getProductsByKeyWord(
      {String query = "", String params = ""}) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/product/search?q=$query$params');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    // _searchProducts= json.decode(AppConst.searchResponse)["data"];
    _searchProducts = json.decode(response.body)["data"];
    // _searchProducts=data.map((e) => null)
    notifyListeners();
    print('Products: $_searchProducts');
  }

  Future<void> searchProduct() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final url = Uri.parse(baseUrl + 'api/products');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    _productsTest = json.decode(response.body);
    _searchProducts = [];
    _productsTest['data'].forEach((element) => _searchProducts.add(element));
    print('Search Products $_searchProducts');
    notifyListeners();
  }
}
