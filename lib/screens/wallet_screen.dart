import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/datamodel/AddWalletM.dart';
import 'package:tanvi/datamodel/WalletM.dart';
import 'package:tanvi/model/profile/profileProvider.dart';
import 'package:tanvi/model/wallet/WalletProvider.dart';
import 'package:tanvi/util/Helper.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Razorpay razorpay;
  String? responseOrderId;
  String? responsePaymentId;
  String? responseSignature;


  var tecWallet = TextEditingController(text: "100");
  Map<String, dynamic>? data;

  AddWalletM? walletRequest;

  WalletProvider? walletProvider;

  @override
  void initState() {
    data = Provider
        .of<ProfileProvider>(context, listen: false)
        .profile;
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  void didChangeDependencies() {
   walletProvider= Provider.of<WalletProvider>(context);
   walletProvider!.updateIfNull();
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    var walletGreen = Color(
        0xFF6EA343);
    var wallet = walletProvider!.walletM;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if(wallet!=null)...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.wallet_outlined, size: 80, color: walletGreen,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wallet balance", style: Get.textTheme.titleLarge,),
                          SizedBox(height: 8),
                          Text(
                            "Rs ${wallet.walletBalance}", style: Get.textTheme.displaySmall!.copyWith(
                              color: walletGreen,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "USer Wallet for hassle free payments on checkout and to recied cashbacks and credits",
                  style: Get.textTheme.caption),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add money", style: Get.textTheme.titleLarge),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: tecWallet,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [100, 500, 1000, 2000].map((e) =>
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: OutlinedButton(onPressed: () {
                                double? valletAmount = double.tryParse(
                                    tecWallet.text);
                                if (valletAmount == null) {
                                  showToast("Invalid Amount");
                                  return;
                                }
                                tecWallet.text = (valletAmount + e).toString();
                              }, child: Text("+$e")),
                            )).toList(),
                      ),
                    ),
                    FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(onPressed: () async {
                          double? valletAmount = double.tryParse(tecWallet.text);
                          if (valletAmount == null) {
                            showToast("Invalid Amount");
                            return;
                          }
                          addMoneyToWallet(valletAmount);
                        }, child: Text("Add Money")))
                  ],
                ),
              ),
            ),
          /*  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add money", style: Get.textTheme.titleLarge),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Expansion List tile")
                  ],
                ),
              ),
            ),*/

          ],
        ),
      ),
    );
  }

  void addMoneyToWallet(double amount) {
    ApiSevece.addMonyetowallet(amount).then((value) {
      if (value?.status != ApiSevece.statusSuccess) {
        showToast(value?.message ?? "");
        return;
      }
      walletRequest = value;
      try {
        var options = {
          'key': 'rzp_live_3rG4OQtcjC1WS3',
          'amount': amount,
          'name': 'Tanvee Order',
          'order_id': value!.data!.id,
          'prefill': {
            'contact': data!['data']['mobile'],
            'email': data!['data']['email']
          }
        };
        print('OPTIONS $options');
        razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    });
  }

  void _handlePaymentSuccess(
      PaymentSuccessResponse paymentSuccessResponse) async {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + paymentSuccessResponse.paymentId!,
        toastLength: Toast.LENGTH_LONG);

    responseOrderId = paymentSuccessResponse.orderId;
    responsePaymentId = paymentSuccessResponse.paymentId;
    responseSignature = paymentSuccessResponse.signature;

    print('Payment Response Order ID ${paymentSuccessResponse.orderId}');
    print('Payment Response Payment ID ${paymentSuccessResponse.paymentId}');
    print('Payment Response Signature ${paymentSuccessResponse.signature}');

    var receipt = walletRequest?.data?.receipt;
    print('Recipt : ${receipt}');
    print('Payment Success Order ID: $responseOrderId');
    print('Payment Success Payment ID: $responsePaymentId');
    print('Payment Success Signature: $responseSignature');
   var response=await ApiSevece.verifyWalletAmount(
        transactionId: walletRequest!.transactionNumber!,
        razorpay_payment_id: responsePaymentId!,
        razorpay_order_id: responseOrderId!,
        razorpay_signature: responseSignature!);
   if(response==true){
     print("Amount Added successfully");
     walletProvider!.updateWalletBalance();
   }
/*    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PaymentLoadingScreen(receipt!, responseOrderId!,
            responsePaymentId!, responseSignature!)));*/
  }

  void _handlePaymentError(PaymentFailureResponse paymentFailureResponse) {
    Fluttertoast.showToast(
        msg: "ERROR: " +
            paymentFailureResponse.code.toString() +
            "-" +
            paymentFailureResponse.message!,
        toastLength: Toast.LENGTH_LONG);
    print('PAYMENT ERROR ${paymentFailureResponse.code.toString()}');
    print('PAYMENT DESCRIPTION ${paymentFailureResponse.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + externalWalletResponse.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }


}
