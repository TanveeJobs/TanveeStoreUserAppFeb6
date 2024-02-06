import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/datamodel/WalletCheckoutM.dart';
import 'package:tanvi/datamodel/WalletM.dart';

class WalletProvider with ChangeNotifier{
  WalletM? walletM;
  updateWalletBalance() async {
   walletM=await ApiSevece.getWalletBalancee();
   notifyListeners();
  }
  updateIfNull(){
    if(walletM==null) updateWalletBalance();
  }
  walletCheckout() async {
    WalletCheckoutM? walletCheckoutM= await ApiSevece.walletPurchase();
    if(walletCheckoutM?.status==statusSuccess){
      updateWalletBalance();
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Thank You!! Your order is successfully placed!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar()),
      ));
      // localStorage.remove('couponCode');

    }
    Navigator.of(Get.context!).pushNamed('/landing-page');
  }

}