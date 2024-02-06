import 'package:flutter/material.dart';

class ReferFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.02),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refer A Friend',
            // textScaleFactor: textScaleFactor,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Refer A Friend',
            textAlign: TextAlign.center,
            // textScaleFactor: textScaleFactor,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: Text(
              'and Get',
              // textAlign: TextAlign.center,
              // textScaleFactor: textScaleFactor,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹',
                // textAlign: TextAlign.center,
                // textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                '100 OFF',
                // textAlign: TextAlign.center,
                // textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          )
        ],
      ),
    );
  }
}
