import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/addToCart/addToCart.dart';

class GrandTotalWidget extends StatefulWidget {
  final double total;
  GrandTotalWidgetState createState() => GrandTotalWidgetState();

  GrandTotalWidget(this.total);
}

class GrandTotalWidgetState extends State<GrandTotalWidget> {
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AddToCartProvider>(context).cartData;

    // TODO: implement build
    return isLoading
        ? CircularProgressIndicator(
            color: Colors.green,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: const Text('Checkout',
                    // // textScaleFactor: textScaleFactor,
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.04),
                child: Text(
                    // '₹500',
                    // provider['data']['grandTotal'].toString(),
                    widget.total.toString(),
                    // price.toString(),
                    // // textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
              )
            ],
          );
  }
}
