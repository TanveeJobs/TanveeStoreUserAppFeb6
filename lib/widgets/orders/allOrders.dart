import 'package:flutter/material.dart';

class AllOrders extends StatefulWidget {
  AllOrdersState createState() => AllOrdersState();
}

class AllOrdersState extends State<AllOrders> {
  final Map<String, dynamic> _allOrders = {
    'data': [
      {
        'id': 1,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 2,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 3,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 4,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 5,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 6,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 7,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      },
      {
        'id': 8,
        'name': 'Pizza Corner',
        'price': 209,
        'rating': 3.7,
        'totalRatings': 124,
        'types': ['Pizza', 'Continental'],
        'image': 'assets/images/pngwing.com(1).png'
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: ListView.builder(
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: height * 0.12,
                          margin: EdgeInsets.only(bottom: height * 0.01),
                          // color: Colors.white,
                          child: Column(children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                // color: Colors.yellow,
                                child: Row(children: [
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                        height: height * 0.08,
                                        decoration: BoxDecoration(
                                            // color: Colors.purple,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    197, 223, 54, 1),
                                                width: 2)),
                                        child: Image.asset(
                                            _allOrders['data'][index]['image']),
                                      )),
                                  Flexible(
                                      flex: 4,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        height: height * 0.1,
                                        padding:
                                            EdgeInsets.only(left: width * 0.02),
                                        // color: Colors.black,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    _allOrders['data'][index]
                                                        ['name'],
                                                    textScaleFactor: textScale,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Row(
                                                  children: [
                                                    Text('₹',
                                                        textScaleFactor:
                                                            textScale,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                        width: width * 0.02),
                                                    Text(
                                                        _allOrders['data']
                                                                [index]['price']
                                                            .toString(),
                                                        textScaleFactor:
                                                            textScale,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.star_rate_rounded,
                                                    color: Colors.yellow),
                                                Text(
                                                    _allOrders['data'][index]
                                                            ['rating']
                                                        .toString(),
                                                    textScaleFactor: textScale,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                Text(
                                                    '(${_allOrders['data'][index]['totalRatings'].toString()} ratings)',
                                                    textScaleFactor: textScale,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12))
                                              ],
                                            ),
                                            // Row(
                                            //   children: [
                                            //     _allOrders['data'][index]
                                            //             ['types']
                                            //         .map((value) => Text(value,
                                            //             textScaleFactor:
                                            //                 textScale,
                                            //             style: const TextStyle(
                                            //                 color:
                                            //                     Colors.white)))
                                            //         .toList(),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ))
                                ]),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                // color: Colors.green,
                                child: Center(
                                    child: InkWell(
                                  onTap: () {},
                                  child: Text('Re-Order',
                                      textScaleFactor: textScale,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ),
                            )
                          ])),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.1, right: width * 0.1),
                        child: Container(
                          width: double.infinity,
                          height: height * 0.001,
                          color: const Color.fromRGBO(204, 218, 123, 1),
                        ),
                      )
                    ],
                  ),
                ),
            itemCount: _allOrders['data'].length),
      ),
    );
  }
}
