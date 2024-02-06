import 'package:flutter/material.dart';

class Frequent extends StatefulWidget {
  FrequentState createState() => FrequentState();
}

class FrequentState extends State<Frequent> {
  final List<dynamic> _frequentItems = [
    {
      'id': 1,
      'image': 'assets/images/5a38c13bd49760.4796956515136689238708.png',
      'name': 'Coffee'
    },
    {'id': 2, 'image': 'assets/images/pngegg(1).png', 'name': 'Spinach'},
    {'id': 3, 'image': 'assets/images/pngegg(2).png', 'name': 'Onion'},
    {'id': 4, 'image': 'assets/images/pngegg(5).png', 'name': 'Kiwi'},
    {'id': 5, 'image': 'assets/images/pngegg.png', 'name': 'Apple'},
    {
      'id': 6,
      'image': 'assets/images/vegetables-15395.png',
      'name': 'Vegetables'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.02),
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
          Text(
            'Frequently Brought',
            // // textScaleFactor: textScaleFactor,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: tabLayout
                    ? 25
                    : largeLayout
                        ? 18
                        : 12),
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.amber,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: width * 0.35,
                  height: height * 0.06,
                  // margin: EdgeInsets.only(right: width * 0.02),
                  padding: EdgeInsets.only(
                      left: width * 0.01,
                      top: height * 0.01,
                      right: width * 0.01),
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Container(
                        width: tabLayout
                            ? height * 0.25
                            : largeLayout
                                ? height * 0.12
                                : height * 0.18,
                        height: tabLayout
                            ? height * 0.175
                            : largeLayout
                                ? height * 0.12
                                : height * 0.15,
                        // padding: EdgeInsets.symmetric(
                        //     vertical: height * 0.02, horizontal: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Image.asset(
                          _frequentItems[index]['image'],
                          // fit: BoxFit.contain,
                          scale: 0.5,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        _frequentItems[index]['name'],
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 18
                                : largeLayout
                                    ? 14
                                    : 12),
                      )
                    ],
                  ),
                ),
                itemCount: _frequentItems.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
