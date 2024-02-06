import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/datamodel/WalletM.dart';
import 'package:tanvi/model/wallet/WalletProvider.dart';

class MyWalletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WalletProvider  walletProvider= Provider.of<WalletProvider>(context);
    walletProvider.updateIfNull();
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wallet,color: Colors.black87),
          SizedBox(width: 4,),
          Text("Rs ${walletProvider.walletM?.walletBalance.toString()}",style: Get.textTheme.titleLarge!.copyWith(
              color: Colors.black87
          ),),
        ],
      ),
    );
  }
}
