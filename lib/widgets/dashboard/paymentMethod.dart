import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethodState createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethod> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.02, top: height * 0.01, right: width * 0.02),
            child: Text(
              'Payment Method',
              // // textScaleFactor: textScaleFactor,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as int;
                    });
                  }),
              Text(
                'Cash On Delivery',
                // // textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as int;
                    });
                  }),
              Text(
                'Razorpay',
                // // textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
