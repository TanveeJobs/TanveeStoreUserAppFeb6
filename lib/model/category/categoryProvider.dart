import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tanvi/util/app_const.dart';

class CategoryProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  List<dynamic> _category = [];
  List<dynamic> _categoriesList = [];
  List<dynamic> _catList = [];

  List<dynamic> get category {
    return [..._category];
  }

  List<dynamic> get categoriesList {
    return [..._categoriesList];
  }

  Future<void> getCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    if (_category.length < 1) {
      var category = GetStorage().read(AppConst.category);
      if (category != null) _category = [json.decode(category)];

      final response = await http.get(url);
      print(url);
      print("category response: ${response.statusCode}: ${response.body}");
      GetStorage().write(AppConst.category, response.body);
      _category = json.decode(response.body);
    }

    print('Category: $_category');
  }

  Future<void> getSearchCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    final response = await http.get(url);
    _categoriesList = [];
    _catList = json.decode(response.body);
    _catList.forEach((value) => _categoriesList.add(value));
    print(_categoriesList);
  }
}
