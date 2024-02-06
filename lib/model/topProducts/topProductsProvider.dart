import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:get_storage/get_storage.dart';
class TopProductsProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  List<dynamic> _topProductsFirst = [];
  List<dynamic> _topProductsSecond = [];

  List<dynamic> get topProductsFirst {
    return [..._topProductsFirst];
  }

  List<dynamic> get topProductsSecond {
    return [..._topProductsSecond];
  }

  Future<void> getTopProducts() async {
    late int i;
    var uri = baseUrl + 'api/dashboard/fresh/arrival-products/';

    final url = Uri.parse(uri);
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var headder = GetStorage().read(AppConst.keyIsSkippedLogin)==true?null:{
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    };
    final response = await http.get(url, headers: headder);

    var firstResponse = json.decode(response.body);
    print("Fresh arrivals Url ${uri.toString()}");
    print(response.body);

    for (i = 0; i < firstResponse['data'].length; i++) {
      if (i == 0) {
        _topProductsFirst = [];
        _topProductsSecond = [];
      }

      if (i < firstResponse['data'].length / 2) {
        _topProductsFirst.add(firstResponse['data'][i]);
      } else {
        _topProductsSecond.add(firstResponse['data'][i]);
      }
    }

    print('Top Products First: $_topProductsFirst');
    print('Top Products Second: $_topProductsSecond');
  }
}
