import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/model/addToCart/addToCart.dart';
import 'package:tanvi/util/app_const.dart';
import 'package:tanvi/widgets/cart/CartM.dart';

class CartAddButtonWidget extends StatefulWidget {
  CartM? cartM;
  ProductM? productM;

  CartAddButtonWidget({this.cartM, this.productM});

  @override
  _CartAddButtonWidgetState createState() => _CartAddButtonWidgetState();
}

class _CartAddButtonWidgetState extends State<CartAddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    print('widget called');
    return widget.cartM != null
        ? Container(
            // color: Colors.red,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (widget.cartM!.quantity < 1) {
                      widget.cartM!.quantity = 0;
                    } else {
                      widget.cartM!.quantity--;
                    }
                    if (widget.cartM!.quantity == 0) {
                      Provider.of<AddToCartProvider>(context, listen: false)
                          .deleteCartItem(
                              cartId: widget.cartM!.id.toInt(),
                              productId: widget.cartM!.productId,
                              sizeId: widget.cartM!.sizeId);
                    } else {
                      Provider.of<AddToCartProvider>(context, listen: false)
                          .editCartItem(cartM: widget.cartM!);
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(1, 1))
                        ]),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: const Icon(Icons.remove, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  // widget.itemMap['selectedQuantity'].toString(),
                  widget.cartM!.quantity.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    widget.cartM!.quantity++;
                    Provider.of<AddToCartProvider>(context, listen: false)
                        .editCartItem(cartM: widget.cartM!);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(1, 1))
                        ]),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          )
        : ElevatedButton(
            onPressed: () {
              if (GetStorage().read(AppConst.keyIsSkippedLogin) == true) {
                Navigator.of(context).pushNamed('/sign-in');
                return;
              }
              setState(() {
                // widget.itemMap['selectedQuantity'] = 1;
                // widget.item.selectedQuantity=1;
              });
              cartAdd(
                  productId: widget.productM!.id!.toInt(),
                  sizeId: widget.productM!.getSelectedQuantity.id.toInt(),
                  quantity: widget.cartM == null ? 1 : widget.cartM!.quantity++,
                  context: context,
                  provider: widget.productM!.toJson());
            },
            child: Text("Add"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          );
  }

  void cartAdd(
      {required int productId,
      required int sizeId,
      required int quantity,
      required BuildContext context,
      required Map<String, dynamic> provider}) async {
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false).postToCart(
            productId: productId,
            quantity: quantity,
            sizeId: sizeId,
            isAdd: true);
    final res = json.decode(response.body);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print("Provider ${provider}");
    localStorage.setInt('cartLength', provider['data']?['cartItem']?.length);

    print(res);
    if (res['data']['message'] == 'Product added to cart.') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Product Added To Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
    if (res['data']['message'] == 'Product available in cart.') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Product Already Available In Cart',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          )));
    }
  }
}
