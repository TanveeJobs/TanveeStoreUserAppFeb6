import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tanvi/ApiService/ApiService.dart';
import 'package:tanvi/const/AppConst.dart';
import 'package:tanvi/const/OrderStatus.dart';
import 'package:tanvi/util/Helper.dart';

class CancelOrderScreeen extends StatefulWidget {
  Map product;
  int itemIndex;
  CancelOrderScreeen({Key? key,required this.product,required this.itemIndex}) : super(key: key);

  @override
  State<CancelOrderScreeen> createState() => _CancelOrderScreeenState();
}

class _CancelOrderScreeenState extends State<CancelOrderScreeen> {
  List<String> reasons = [
    "I am not at home",
    "I placed a wrong order",
    "I forget to apply voucher",
    "I forgot to add additional products/items"
  ];

  String? selectedReason;
  var tecRemarks=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancel Order"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Select Reason To Cancel"),
          ),
          ...reasons
              .map((e) => RadioListTile<String>(
                  value: e,
                  groupValue: selectedReason,
                  title: Text(e),
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value!;
                    });
                  }))
              .toList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: tecRemarks,
              decoration: InputDecoration(
                labelText: "Please tell us why you want to cancel this order",
                border: textFieldBorder
              ),
              minLines: 4,
              maxLines: 6,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (selectedReason == null) {
                  showToast("Please Select Reason to cancel");
                  return;
                }
              /*  if (tecRemarks.text.isEmpty) {
                  showToast("Please Enter Reason to cancel");
                  return;
                }*/

                print("cancel Order Called");
                var product =
                    widget.product;
                ApiSevece.returnOrder(
                    orderProductDetilsId:
                    product['order_products']
                    [widget.itemIndex]['id'].toString(),
                    orderNumber: product[
                    'order_details']
                    ['order_number'],
                    returnQunatity: product[
                    'order_products'][
                    widget.itemIndex]['quantity'].toString(),
                orderStatus: OrderStatus.cancelled,
                  remarks: selectedReason! + ".\n "+tecRemarks.text
                );
              },
              child: Text("Cancel Order"))
        ],
      ),
    );
  }
}
