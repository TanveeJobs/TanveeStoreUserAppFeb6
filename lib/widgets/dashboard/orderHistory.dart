import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/orderHistory/orderHistory.dart';
import '../../screens/pendingOrdersPage.dart';

class OrderHistory extends StatefulWidget {
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends State<OrderHistory> {
  bool isLoading = true;

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
    final orderHistory =
        Provider.of<OrderHistoryProvider>(context).orderHistory;
    final pendingOrders =
        Provider.of<OrderHistoryProvider>(context).pendingHistory;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 1,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                child: Text(
                  'Order History',
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
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.02, top: height * 0.01),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PendingOrders())),
                  child: Text(
                    'View All',
                    // // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 16
                            : largeLayout
                                ? 12
                                : 10),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(height: height * 0.02),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Expanded(
                  child: Container(
                  width: double.infinity,
                  // color: Colors.amber,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: tabLayout
                          ? height * 0.14
                          : largeLayout
                              ? height * 0.1
                              : height * 0.155,
                      margin: EdgeInsets.only(bottom: height * 0.005),
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Flexible(
                            flex: !tabLayout && !largeLayout ? 2 : 1,
                            child: Icon(Icons.shopping_cart,
                                size: tabLayout
                                    ? 80
                                    : largeLayout
                                        ? 60
                                        : 20),
                            // child: Container(
                            //   height: double.infinity,
                            //   // color: Colors.pink,
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: height * 0.01,
                            //       horizontal: width * 0.01),
                            //   child: Container(
                            //       width: double.infinity,
                            //       height: double.infinity,
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: height * 0.01,
                            //           horizontal: width * 0.01),
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           border: Border.all(
                            //               color: Colors.green,
                            //               width: 3,
                            //               style: BorderStyle.solid),
                            //           borderRadius: BorderRadius.circular(20),
                            //           boxShadow: const [
                            //             BoxShadow(
                            //                 color: Colors.grey,
                            //                 blurRadius: 5,
                            //                 offset: Offset(0, 2))
                            //           ]),
                            //       child: ClipRRect(
                            //         borderRadius: BorderRadius.circular(20),
                            //         child: Image.network(
                            //           'AppConst.baseUrl${orderHistory['data'][index]['order_products']['product']['main_image']}',
                            //           fit: BoxFit.cover,
                            //         ),
                            //       )),
                            // ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              height: double.infinity,
                              // color: Colors.purple,
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   orderHistory['data'][index]
                                  //       ['order_products']['product']['name'],
                                  //   // // textScaleFactor: textScaleFactor,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: tabLayout
                                  //           ? 25
                                  //           : largeLayout
                                  //               ? 16
                                  //               : 12),
                                  // ),
                                  Text(
                                    'Order No = ${orderHistory['data'][index]['order_details']['order_number']}',
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 25
                                            : largeLayout
                                                ? 16
                                                : 12),
                                  ),
                                  Text(
                                    orderHistory['data'][index]['order_details']
                                        ['order_status'],
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: orderHistory['data'][index]
                                                        ['order_details']
                                                    ['order_status'] ==
                                                'Order Placed'
                                            ? Colors.blue
                                            : orderHistory['data']
                                                                    [index]
                                                                [
                                                                'order_details']
                                                            ['order_status']
                                                        ['order_status'] ==
                                                    'On The Way'
                                                ? Colors.amber
                                                : Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 20
                                            : largeLayout
                                                ? 16
                                                : 12),
                                  ),
                                  Text(
                                    'No Of Item(s): ${orderHistory['data'][index]['order_products'].length}',
                                    style: TextStyle(
                                        fontSize: tabLayout
                                            ? 20
                                            : largeLayout
                                                ? 16
                                                : 12),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: orderHistory['data'].length < 3
                        ? orderHistory['data'].length
                        : 3,
                  ),
                ))
        ],
      ),
    );
  }
}
