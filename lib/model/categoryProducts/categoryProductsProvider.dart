import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/util/app_const.dart';
import 'dart:convert';
import './categoryProductsModel.dart';
import 'package:http/http.dart' as http;

class CategoryProductsProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;

  List<ProductM> productList = [];
  Map<String, dynamic> _categoryProducts = {};

  Map<String, dynamic> get categoryProducts {
    return {..._categoryProducts};
  }

  Future<void> getCategoryProducts(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/products?category=$id');
    var headder = GetStorage().read(AppConst.keyIsSkippedLogin) == true
        ? null
        : {
            // 'Authorization': 'Bearer ${localStorage.getString('token')}',
            'Content-Type': 'application/json'
          };
    final response = await http.get(url, headers: headder);
    print("Url ${url.toString()}");
    print("Category Response ${response.body}");

    if (response.statusCode == 200) {
      _categoryProducts = json.decode(response.body);
      // _categoryProducts = json.decode(AppConst.ctegoryResponse);
      print('Category Products: $_categoryProducts');
      productList = List<ProductM>.from(
          _categoryProducts["data"].map((x) => ProductM.fromJson(x)));
    } else {
      _categoryProducts = {'data': []};
    }
    notifyListeners();
    // if (response.statusCode == 200) {
    //   _categoryProducts = json.decode(response.body);
    //   print('Category Products: $_categoryProducts');
    // } else {
    //   _categoryProducts = {'data': []};
    // }
  }
}
