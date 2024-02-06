import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/orders/order_item_widget.dart';
import '../../../model/orderHistory/orderHistory.dart';
import '../../../screens/pendingOrdersPage.dart';
import 'package:intl/intl.dart';

class RecentItems extends StatefulWidget {
  RecentItemsState createState() => RecentItemsState();
}

class RecentItemsState extends State<RecentItems> {
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

  // bool isLoading = true;
  // // bool isExpanded = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<OrderHistoryProvider>(context, listen: false)
  //       .getOrderHistory()
  //       .then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

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
      child:
          // isLoading
          //     ? const Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.green,
          //         ),
          //       )
          //     :
          Container(
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
                  style: sectionTitle,
                  // // textScaleFactor: textScaleFactor,
                  /*     style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 17
                              : 12),*/
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PendingOrders())),
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
              itemBuilder: (context, index) {
                var itemMap = provider['data'][index];
                return OrderItemWidget(itemMap);
              },
              itemCount:
                  provider['data'].length > 3 ? 3 : provider['data'].length,
            )
          ],
        ),
      ),
    );
  }
}
