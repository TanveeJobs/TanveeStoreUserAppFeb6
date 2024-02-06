import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:tanvi/util/app_const.dart';

class NotificationList with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;

  Map<String, dynamic> _notificationList = {};

  Map<String, dynamic> get notificationList {
    return {..._notificationList};
  }

  Future<void> getNotificationList() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final response =
        await http.get(Uri.parse(baseUrl + 'api/notification/'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      _notificationList = res;
    } else {
      _notificationList = {};
    }

    print('Notification Response: $_notificationList');
  }

  Future<Map<String, dynamic>> postNotificationList(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final response = await http.post(Uri.parse(baseUrl + 'api/notification/'),
        body: json.encode({'id': id}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        });

    var res = json.decode(response.body);

    print('POST Notification Response: $res');

    return res;
  }
}
