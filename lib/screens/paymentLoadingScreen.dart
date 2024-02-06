import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/widgets/bottomNavigation.dart';
import '../model/order/orderProvider.dart';

class PaymentLoadingScreen extends StatefulWidget {
  final String receipt;
  final String responseOrderId;
  final String responsePaymentId;
  final String responseSignature;

  PaymentLoadingScreenState createState() => PaymentLoadingScreenState();

  PaymentLoadingScreen(this.receipt, this.responseOrderId,
      this.responsePaymentId, this.responseSignature);
}

class PaymentLoadingScreenState extends State<PaymentLoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderProvider>(context, listen: false)
        .razorPayVerification(widget.receipt, widget.responseOrderId,
            widget.responsePaymentId, widget.responseSignature)
        .then((_) {
      final provider =
          Provider.of<OrderProvider>(context, listen: false).verification;
      if (provider['status'] == 'success') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('Payment Verified',
                      style: TextStyle(
                        color: Colors.green,
                      )),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomBottomNavigation())),
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold)))
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('Payment Failed',
                      style: TextStyle(
                        color: Colors.red,
                      )),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomBottomNavigation())),
                        child: Text('OK',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)))
                  ],
                ));
      }
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context).verification;

    // TODO: implement build
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            'Verifying Payment',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ));
  }
}
