import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/model/addToCart/addToCart.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/cart/CartM.dart';
import 'package:tanvi/widgets/cart/cart_add_button_widget.dart';
import 'package:tanvi/widgets/counter_widget.dart';
import 'package:tanvi/widgets/variant_widget.dart';

class ProductWidget extends StatefulWidget {
  ProductM item;
  Map itemMap;
  Map<String, dynamic> cartItem;

  ProductWidget(
      {required Key key,
      required this.item,
      required this.itemMap,
      required this.cartItem})
      : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  AddToCartProvider? cartProvider;
  int testCount = 1;

  @override
  void initState() {
    cartProvider = Provider.of<AddToCartProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    CartM? cartM =
        cartProvider!.isCartHasThisProduct(widget.item.getSelectedQuantity);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      child: Container(
        width: double.infinity,
        // height: height * 0.2,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
        // margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(1, 2))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.17,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green, width: 2.5),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${widget.item.mainImage}'),
                            //     // scale: 1.5,
                            //     fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: Image.network(
                            '${AppConst.baseUrl.substring(0, AppConst.baseUrl.length - 1)}${widget.item.mainImage}'),
                      ),
                      Visibility(
                        // visible: widget.item.discountPercentage > 0,
                        visible:
                            widget.item.getSelectedQuantity.discountPercentage >
                                0,
                        child: Container(
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(25),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.green),
                          // margin: EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 16),
                            child: Text(
                              // "${widget.item.discountPercentage}% OFF",
                              "${widget.item.getSelectedQuantity.discountPercentage}% OFF",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: width * 0.02),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
                    height: height * 0.23,
                    // color: Colors.amber,
                    child: Column(
                      children: [
                        Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              width: double.infinity,
                              // color: Colors.red,
                              padding: EdgeInsets.only(
                                  left: width * 0.02,
                                  top: height * 0.005,
                                  bottom: height * 0.005),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    widget.item.name ?? "",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: height * 0.04,
                                    // padding: EdgeInsets.only(left: width * 0.02),
                                    // color:Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        VariantWidget(
                                          item: widget.item,
                                          onTap: () {
                                            setState(() {});
                                          },
                                        )
                                        /* AutoSizeText(
                                            // '${widget.itemMap['weight']} ${widget.itemMap['uom']['short_name']}',
                                            '${widget.item.getSelectedQuantity.weight} ${widget.item.uom?.shortName}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[600])),*/
                                      ],
                                    ),
                                  ),
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        /*AutoSizeText(
                                         // '₹${widget.item.offer_price}',
                                         '${widget.item.getSelectedQuantity.discountPercentage}',
                                         style: productPrice,
                                       ),*/
                                        if (widget.item.getSelectedQuantity
                                                .discountPrice >
                                            0) ...[
                                          AutoSizeText(
                                            // '₹${widget.item.offer_price}',
                                            '₹${widget.item.getSelectedQuantity.offerPrice}',
                                            style: productPrice,
                                          ),
                                        ],
                                        if ((widget.item.getSelectedQuantity
                                                .discountPercentage >
                                            0))
                                          AutoSizeText(
                                            '₹${widget.item.getSelectedQuantity.price}',
                                            style:
                                                // widget.item.discountPercentage ==
                                                widget.item.getSelectedQuantity
                                                            .discountPercentage ==
                                                        0
                                                    ? productPrice
                                                    : productOfferPrice,
                                          ),
                                        /* if (!(widget.item.getSelectedQuantity.discountPercentage >
                                            0))
                                          SizedBox(
                                            height: 15,
                                          )*/
                                      ])
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CartAddButtonWidget(
                                  cartM: cartM,
                                  productM: widget.item,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/item-details', arguments: {
                      'id': widget.itemMap['id'],
                      'image': widget.itemMap['main_image'],
                      'name': widget.itemMap['name'],
                      'description': widget.itemMap['description'],
                      'price': widget.itemMap['price'],
                      'quantity': widget.itemMap['selectedQuantity'],
                      'itemModel': widget.item
                    });
                  },
                  child: const Text('View Details',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }

  void cartDecrease(/* Map<String, dynamic> provider*/ {
    required int productId,
    required int quantity,
    required int cartItemId,
    required int sizeId,
  }) async {
    print('Cart Decreaseeeeeeeeeeeee: $quantity');
    final response = await Provider.of<AddToCartProvider>(Get.context!,
            listen: false)
        .postToCart(productId: productId, quantity: quantity, sizeId: sizeId);
    final res = json.decode(response.body);

    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setInt('cartLength', provider['data']['cartItem'].length);
  }

  void cartIncrease(int productId, int quantity, BuildContext context,
      Map<String, dynamic> provider,
      {required int sizeId}) async {
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false).postToCart(
            productId: productId, quantity: quantity, sizeId: sizeId);
    final res = json.decode(response.body);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setInt('cartLength', provider['data']['cartItem'].length);
  }
}
