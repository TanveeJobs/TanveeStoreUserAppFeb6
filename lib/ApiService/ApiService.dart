import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/datamodel/AddWalletM.dart';
import 'package:tanvi/datamodel/WalletCheckoutM.dart';
import 'package:tanvi/util/Helper.dart';

import '../datamodel/WalletM.dart';
import '../util/app_const.dart';
String statusSuccess="success";
class ApiSevece {
  static String statusSuccess = "success";

  static Future<WalletM?> getWalletBalancee() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/my-wallet/');
    print("get cart url $url");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print("Wallet response ${response.body}");
    var data = json.decode(response.body)["data"];
    if (data != null) {
      return WalletM.fromJson(data);
    }
    return null;
  }

  static Future<AddWalletM?> addMonyetowallet(double amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/wallet-add-money/');
    print("get cart url $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    }, body: {
      "trasactionAmt": "${amount}",
      "transactionType": "credit",
      "status": "pending"
    });
    print("Wallet response ${response.body}");
    var responseMap = json.decode(response.body);
    var data = responseMap["data"];
    var message = responseMap["message"];
    var status = responseMap["status"];
    return AddWalletM.fromJson(responseMap);
  }

  static Future<WalletCheckoutM?> walletPurchase() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/wallet-debit-money/');
    print("get cart url $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    }, body: {
      "payment_method":"wallet",
      "transactionType":"debit"
    });
    print("Wallet response ${response.body}");
    var responseMap = json.decode(response.body);
    var data = responseMap["data"];
    var message = responseMap["message"];
    var status = responseMap["status"];
    return WalletCheckoutM.fromJson(responseMap);
  }


  static Future<bool> verifyWalletAmount({
    required String transactionId,
    required String razorpay_payment_id,
    required String razorpay_order_id,
    required String razorpay_signature,
  }) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/wallet-money-verifiy/');
    print("get cart url $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    }, body: {
      "transactionId": "${transactionId}",
      "razorpay_payment_id": "${razorpay_payment_id}",
      "razorpay_order_id": "${razorpay_order_id}",
      "razorpay_signature": "${razorpay_signature}"
    });
    print("Wallet response ${response.body}");
    var responseMap = json.decode(response.body);
    // var data = responseMap["data"];
    var message = responseMap["message"];
    var status = responseMap["status"];

   if(status==statusSuccess){
     return true;
   }
   showToast(message);
    return false;
  }
  static Future<bool> getWalletHistory() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/wallet-transaction-history/');
    print("get cart url $url");
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    });
    print("Wallet response ${response.body}");
    var responseMap = json.decode(response.body);
    // var data = responseMap["data"];
    var message = responseMap["message"];
    var status = responseMap["status"];

    if(status==statusSuccess){
      return true;
    }
    showToast(message);
    return false;
  }
  static Future<bool> returnOrder(
      {
        required String orderProductDetilsId,
      required String orderNumber,
      required String returnQunatity,
        required String orderStatus,
        required String remarks
      }) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(AppConst.baseUrl + 'api/customer/order/return-replace/');
    print("get cart url $url");
    var body2 = {
      "id": "${orderProductDetilsId}",
      "order_number": "${orderNumber}",
      "userRemark": remarks,
      "userRemarkStatus": orderStatus,
      "returnQty": "${returnQunatity}"

    };
    print("body ${json.encode(body2)}");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    },body: body2);
    print("return Response response ${response.body}");
    var responseMap = json.decode(response.body);
    // var data = responseMap["data"];
    var message = responseMap["message"];
    var status = responseMap["status"];

    if(status==statusSuccess){
      showToast("Request Sent");
      return true;
    }
    showToast(message);
    return false;
  }

}
