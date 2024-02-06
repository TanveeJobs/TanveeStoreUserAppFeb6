import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/util/app_const.dart';
import '../../../model/orderHistory/orderHistory.dart';
import '../../../screens/pendingOrdersPage.dart';

class ViewRecent extends StatefulWidget {
  ViewRecentState createState() => ViewRecentState();
}

class ViewRecentState extends State<ViewRecent> {
  bool isLoading = true;
  // bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderHistoryProvider>(context, listen: false)
        .getOrderHistory()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<OrderHistoryProvider>(context).orderHistory;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              width: double.infinity,
              // height: height * 0.7,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Orders',
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 25
                                : largeLayout
                                    ? 17
                                    : 12),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PendingOrders())),
                        child: Text(
                          'View All',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 18
                                  : largeLayout
                                      ? 14
                                      : 10),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: tabLayout
                                ? height * 0.14
                                : largeLayout
                                    ? height * 0.1
                                    : height * 0.12,
                            padding: EdgeInsets.fromLTRB(width * 0.01,
                                height * 0.005, width * 0.02, height * 0.005),
                            margin: provider['data'][index]['order_details']
                                        ['isExpanded'] ==
                                    true
                                ? const EdgeInsets.only(bottom: 0)
                                : EdgeInsets.only(bottom: height * 0.04),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: provider['data'][index]
                                            ['order_details']['isExpanded'] ==
                                        true
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))
                                    : BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 2))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //   height: double.infinity,
                                //   width: width * 0.2,
                                //   decoration: BoxDecoration(
                                //       color: Colors.green[100],
                                //       borderRadius: BorderRadius.circular(15)),
                                //   child: Image.network(
                                //       provider[index]['product']['main_image']),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider['data'][index]['order_details']
                                            ['order_number'],
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 23
                                                : largeLayout
                                                    ? 15
                                                    : 10),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        provider['data'][index]['order_details']
                                            ['created_at'],
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 16
                                                : largeLayout
                                                    ? 8
                                                    : 8),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: tabLayout
                                        ? width * 0.3
                                        : largeLayout
                                            ? width * 0.1
                                            : width * 0.25),
                                Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '₹${provider['data'][index]['order_details']['grand_total']}',
                                        // // textScaleFactor: textScaleFactor,
                                        // textScaleFactor:
                                        //     MediaQuery.of(context).textScaleFactor *
                                        //         1.2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 45
                                                : largeLayout
                                                    ? 13
                                                    : 10),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          print(
                                              'length: ${provider['data'][index]['order_products'].length}');
                                          print(
                                              'isExpanded: ${provider['data'][index]['order_details']['isExpanded']}');
                                          setState(() {
                                            provider['data'][index]
                                                        ['order_details']
                                                    ['isExpanded'] =
                                                !provider['data'][index]
                                                        ['order_details']
                                                    ['isExpanded'];
                                          });
                                        },
                                        child: Icon(!provider['data'][index]
                                                ['order_details']['isExpanded']
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up))
                                  ],
                                )
                              ],
                            ),
                          ),
                          if (provider['data'][index]['order_details']
                                  ['isExpanded'] ==
                              true)
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ]),
                              child: Container(
                                width: double.infinity,
                                height: height * 0.2,
                                padding: const EdgeInsets.all(5),
                                // color: Colors.red,
                                child: ListView(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int itemDetails = 0;
                                            itemDetails <
                                                provider['data'][index]
                                                        ['order_products']
                                                    .length;
                                            itemDetails++)
                                          Container(
                                            width: width * 0.2,
                                            height: height * 0.06,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 2)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '${AppConst.baseUrl}${provider['data'][index]['order_products'][itemDetails]['product']['main_image']}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        SizedBox(width: width * 0.02),
                                        Column(
                                          children: [
                                            for (var itemDetails
                                                in provider['data'][index]
                                                    ['order_products'])
                                              Text(
                                                '${itemDetails['product']['name']} ${itemDetails['product']['weight']}${itemDetails['product']['uom']['short_name']}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            for (int itemDetails = 0;
                                                itemDetails <
                                                    provider['data'][index]
                                                            ['order_products']
                                                        .length;
                                                itemDetails++)
                                              Text(
                                                  '₹${provider['data'][index]['order_products'][itemDetails]['price']} x ${provider['data'][index]['order_products'][itemDetails]['quantity']} ')
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // child: ListView.builder(
                                //     itemBuilder: (context, index) => Row(
                                //           children: [
                                //             // for (var itemDetails
                                //             //     in provider['data'][index]
                                //             //         ['order_products'])
                                //             Container(
                                //               width: width * 0.2,
                                //               height: height * 0.06,
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(10),
                                //                   border: Border.all(
                                //                       color: Colors.green,
                                //                       width: 2),
                                //                   boxShadow: const [
                                //                     BoxShadow(
                                //                         color: Colors.grey,
                                //                         blurRadius: 5,
                                //                         offset: Offset(1, 2))
                                //                   ]),
                                //               child: ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 child: Image.network(
                                //                   'AppConst.baseUrl${provider['data'][index]['order_products'][index]['product']['main_image']}',
                                //                   fit: BoxFit.cover,
                                //                 ),
                                //               ),
                                //             ),
                                //             SizedBox(width: width * 0.02),
                                //             // for (var itemDetails
                                //             //     in provider['data'][index]
                                //             //         ['order_products'])
                                //             Column(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.start,
                                //               children: [
                                // Text(
                                //     '${provider['data'][index]['order_products'][index]['product']['name']} ${provider['data'][index]['order_products'][index]['product']['weight']}${provider['data'][index]['order_products'][index]['product']['uom']['short_name']}'),
                                // Text(
                                //     '₹${provider['data'][index]['order_products'][index]['price']} x ${provider['data'][index]['order_products'][index]['quantity']} ')
                                //               ],
                                //             )
                                //           ],
                                //         ),
                                //     itemCount: provider['data'][index]
                                //             ['order_products']
                                //         .length),
                              ),
                            )
                        ],
                      ),
                    ),
                    itemCount: provider['data'].length,
                  )
                ],
              ),
            ),
    );
  }
}
