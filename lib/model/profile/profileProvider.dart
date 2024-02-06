import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/authentication/network.dart';
import 'dart:io';

import 'package:tanvi/util/app_const.dart';

class ProfileProvider with ChangeNotifier {
  String baseUrl = AppConst.baseUrl;
  Map<String, dynamic> _profile = {};

  Map<String, dynamic> get profile {
    return {..._profile};
  }
  bool get isLogedUser=> GetStorage().read(AppConst.keyIsSkippedLogin)!=true;
  String get getFirstName=>"${profile['data']?['first_name']}";
  String get getLastName=>"${profile['data']?['last_name']}";
  String get getFullName=>"$getFirstName $getLastName";
  String get getEmail=>"${profile['data']?['email']}";
  String get getProfileImageEndPoind=>"${profile['data']?['profile_pic']}";
  String get getProfileImage=>"$baseUrl$getProfileImageEndPoind";
  String get getMobile=>"${profile['data']?['mobile']}";




  Future<void> getProfileDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    _profile = json.decode(response.body);
    print('Profile Details: $_profile');
  }

  // Future<dynamic> postProfileUpdate(
  //     File? image, String? email, String? mobile) async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   final url = Uri.parse(baseUrl + 'api/customer/my-details/');

  //   var formData = FormData.fromMap({
  //     'profile_pic': await MultipartFile.fromFile(image!.path),
  //     'email': email,
  //     'mobile': mobile
  //   });

  //   print('Form Data: $formData');

  //   final response = await Dio().post(
  //       'AppConst.baseUrl/api/customer/my-details/',
  //       data: formData,
  //       options: Options(headers: {
  //         'Authorization': 'Bearer ${localStorage.getString('token')}'
  //       }));

  //   return response;
  // }

  Future<dynamic> updateProfilePicture(File? image) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');

    var request = http.MultipartRequest('POST', url);
    request.headers.addAll({
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    request.files.add(await http.MultipartFile.fromPath(
        'profile_pic', image!.path,
        contentType: MediaType('application', 'x-tar')));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Upoloaded');
      print('Response: ${response.stream.bytesToString()}');
    } else {
      print('Response Error: ${response.stream.bytesToString()}');
      print('Failed');
    }
  }

  Future<dynamic> updateEmail(String email) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        },
        body: json.encode({'email': email}));

    var res = json.decode(response.body);

    print('Update Email: $res');

    return res;
  }

  Future<dynamic> updateNumber(String mobile) async {
    var res;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        },
        body: json.encode({'mobile': mobile}));

    if (response.statusCode == 200) {
      res = json.decode(response.body);
      print('Update Email: $res');
    }

    print('Response Email Change $res');

    return res;
  }

  Future<dynamic> deleteAccount() async {
    var res;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var urlString = (baseUrl + '/api/customer/my-details/');
    final url = Uri.parse(urlString);
    print("Url Path ${urlString}");
    var headers2 = {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        };
    final response = await http.delete(url,
        headers: headers2,
        // body: json.encode({})
    );

    print("Hedder ${headers2}");
    print('Response  ${response.body}');


    return res;
  }
  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'refresh': localStorage.getString('refresh')};
    var response = await Provider.of<Network>(Get.context!, listen: false)
        .logOut(data, 'api/logout/');
    print(response.body);
    localStorage.remove('token');

    Navigator.of(Get.context!)
        .pushNamedAndRemoveUntil('/onboarding-screens', (route) => false);

  }
}
