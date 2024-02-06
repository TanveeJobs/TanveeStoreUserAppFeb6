import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/const/OrderStatus.dart';
import 'package:tanvi/model/order/orderProvider.dart';
import 'package:tanvi/screens/order/cancel_order_screeen.dart';
import 'package:tanvi/util/app_const.dart';

class OrderItemWidget extends StatefulWidget {
  Map itemMap;

  OrderItemWidget(this.itemMap);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16),
            margin: widget.itemMap['order_details']['isExpanded'] == true
                ? const EdgeInsets.only(bottom: 0)
                : EdgeInsets.only(bottom: height * 0.04),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    widget.itemMap['order_details']['isExpanded'] == true
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))
                        : BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                ]),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => CancelOrderScreeen(
                            product: widget.itemMap,
                            itemIndex: 0,
                          ));
                    },
                    child: Text("Cancel Order")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemMap['order_details']['order_number'],
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
                            '${dateFormat.format(DateTime.parse(widget.itemMap['order_details']['created_at']).toLocal())}',
                            // // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout
                                    ? 18
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '₹${widget.itemMap['order_details']['grand_total']}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout
                                        ? 45
                                        : largeLayout
                                            ? 15
                                            : 10),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${widget.itemMap['order_details']['order_status']}',
                                style: Get.textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              print(
                                  'length: ${widget.itemMap['order_products'].length}');
                              print(
                                  'isExpanded: ${widget.itemMap['order_details']['isExpanded']}');
                              setState(() {
                                widget.itemMap['order_details']['isExpanded'] =
                                    !widget.itemMap['order_details']
                                        ['isExpanded'];
                              });
                            },
                            child: Icon(!widget.itemMap['order_details']
                                    ['isExpanded']
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.itemMap['order_details']['isExpanded'] == true)
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
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Container(
                  width: double.infinity,
                  height: height * 0.25,
                  padding: const EdgeInsets.all(5),
                  // color: Colors.red,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      // provider['data'][index]['order_products']
                      children: [
                        for (int itemIndex = 0;
                            itemIndex < widget.itemMap['order_products'].length;
                            itemIndex++)
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: width * 0.25,
                                    height: height * 0.1,
                                    // color: Colors.red,
                                    margin: EdgeInsets.only(
                                        bottom: height * 0.01,
                                        right: width * 0.02),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.green,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 8,
                                              offset: Offset(1, 2))
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${widget.itemMap['order_products'][itemIndex]['product']['main_image']}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03),
                                  SizedBox(
                                    width: width * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.itemMap['order_products'][itemIndex]['product']['name']} ${widget.itemMap['order_products'][itemIndex]['product_weight']['weight']}${widget.itemMap['order_products'][itemIndex]['product_weight']['uom']['short_name']}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                            '₹${widget.itemMap['order_products'][itemIndex]['price']} x${widget.itemMap['order_products'][itemIndex]['quantity']}'),
                                        ElevatedButton(
                                            onPressed: () {
                                              print("cancel Order Called");
                                              var product = widget.itemMap;
                                              ApiSevece.returnOrder(
                                                  orderProductDetilsId:
                                                      product['order_products']
                                                              [itemIndex]['id']
                                                          .toString(),
                                                  orderNumber:
                                                      product['order_details']
                                                          ['order_number'],
                                                  returnQunatity:
                                                      product['order_products']
                                                                  [itemIndex]
                                                              ['quantity']
                                                          .toString(),
                                                  remarks: "",
                                                  orderStatus: OrderStatus
                                                      .partialReturn);
                                            },
                                            child: Text("Cancel Order"))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 12.0,
                              )
                            ],
                          ),
                      ])),
            )
        ],
      ),
    );
  }
}
