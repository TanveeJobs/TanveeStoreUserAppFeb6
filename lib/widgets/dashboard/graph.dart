import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: tabLayout
          ? height * 0.25
          : largeLayout
              ? height * 0.2
              : height * 0.28,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
            child: Text(
              'Order Graph',
              // // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: tabLayout
                      ? 18
                      : largeLayout
                          ? 14
                          : 12),
            ),
          )
        ],
      ),
    );
  }
}
