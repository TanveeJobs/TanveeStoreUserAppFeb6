import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:get_storage/get_storage.dart';

class PopularDealsProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _popularDeals = {};

  Map<String, dynamic> get popularDeals {
    return {..._popularDeals};
  }

  Future<void> getPopularDeals() async {
    print('Before API Call Popular deals: $_popularDeals');

    final url = Uri.parse(baseUrl + 'api/dashboard/popular/ordered-product/');
    // final url = Uri.parse(baseUrl + 'api/dashboard/popular/ordered-with-location-product/');

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var headder = GetStorage().read(AppConst.keyIsSkippedLogin) == true
        ? null
        : {
            'Authorization': 'Bearer ${localStorage.getString('token')}',
            'Content-Type': 'application/json'
          };
    final response = await http.get(url, headers: headder);

    var responseBody = response.body;
    var res = json.decode(responseBody);

    _popularDeals = res;
  }
}
