

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:tanvi/util/app_const.dart';

class OrderHistoryProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _orderHistory = {};
  Map<String, dynamic> _pendingHistory = {};
  List<dynamic> _history = [];

  Map<String, dynamic> get orderHistory {
    return {..._orderHistory};
  }

  Map<String, dynamic> get pendingHistory {
    return {..._pendingHistory};
  }

  List<dynamic> get history {
    return [..._history];
  }

  Future<void> getOrderHistory() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-order/history/');


    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print("Url ${url}");
    print("token required");
    log("responseOrder ${response.body.toString()}");

    // var res = json.decode(response.body);

    if (response.statusCode == 200) {
      _orderHistory = json.decode(response.body);
      for (int index = 0; index < _orderHistory['data'].length; index++) {
        // for (int index = _orderHistory['data'].length; index > 1; index--) {
        _orderHistory['data'][index]['order_details']['isExpanded'] = false;
      }
    } else {
      _orderHistory = {'data': []};
    }

    // for (final order in res) {
    //   if (order['order']['payment_status'] == 'Pending' &&
    //       order['order']['order_status'] == 'Order Placed') {
    //     _pendingHistory = order;
    //   }
    // }

  }
}
