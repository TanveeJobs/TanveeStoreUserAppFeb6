import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tanvi/datamodel/ProductM.dart';
import 'package:tanvi/model/addToCart/addToCartModel.dart';
import 'package:tanvi/util/AppTextStyle.dart';
import 'package:tanvi/widgets/cart/CartM.dart';
import '../widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';
import '../model/addToCart/addToCart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  Map<String, dynamic> updatedProducts = {};
  double totalPrice = 0.0;
  // double totalAmount = 0.0;
  var totalAmount;
  double grand = 0.0;
  int index = 0;
  double tax = 0.0;
  Map<String, dynamic> _cartList = {};
  String? couponCode;
  double amount = 0;
  String? minOrder;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      setState(() {
        totalAmount = Provider.of<AddToCartProvider>(context, listen: false)
            .cartData['data']?['grandTotal'];

        isLoading = false;
        // totalPrice = response['data']['grandTotal'];
      });
      print('Total Price: $totalPrice');
    });
    getCoupon();
    // getTotalPriceCalculation();
    // updateCart;
    // updateCall;
    super.didChangeDependencies();
  }

  // Future<void> getTotalPriceCalculation() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   setState(() {
  //     localStorage.setDouble('counter', 0.0);
  //     totalPrice = localStorage.getDouble('counter')!;
  //   });
  // }

  /* double get taxCalculation {
    final taxCalculation =
        Provider.of<AddToCartProvider>(context, listen: false).cartData;
    tax = 0.0;
    for (final cartItem in taxCalculation['data']['cartItem']) {
      tax += (cartItem['totalPrice'] as num) * (cartItem['tax'] as num) / 100.0;
    }

    print('Tax: $tax');
    //double overAll = taxCalculation['data']['grandTotal'] * tax;
    return tax;
  }*/

  Future<void> getCoupon() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    couponCode = localStorage.getString('couponCode');
    minOrder = localStorage.getString('couponAmount');
    amount = double.parse(minOrder ?? "0");
    //todo here for copon code
    print('Code: $couponCode');
    print('Min Order: $amount');
  }

  void updateCall() async {
    // _cartList = await Provider.of<AddToCartProvider>(context, listen: false)
    //     .getCartProducts();
    Provider.of<AddToCartProvider>(context, listen: false).getCartProducts();
  }

  // void updateCartIncrease(Map<String, dynamic> data, double grandTotal) async {
  void updateCartIncrease(
      {required CartM cartM, required double grandTotal}) async {
    print('Data: $cartM');
    print('Grand Total: $grandTotal');
    setState(() {
      if (totalAmount > 0) {
        totalAmount += cartM.price;
      } else {
        totalAmount = grandTotal + cartM.price!;
      }
      print('Total Priceeeeeeeeeeeeeeeee D $totalAmount');
    });
    var cartProvider = Provider.of<AddToCartProvider>(context, listen: false);
    final response = await cartProvider.editCartItem(cartM: cartM);
  }

  void updateCartDecrease(
      {required CartM cartM, required double grandTotal}) async {
    print('Data: $CartM');
    print('Grand Total: $grandTotal');
    setState(() {
      if (totalAmount > 0) {
        totalAmount -= cartM.price;
      } else {
        if (cartM.quantity > 0) {
          totalAmount = grandTotal - cartM.price!;
        }
      }
      print('Total Priceeeeeeeeeeeeeeeee D $totalAmount');
    });

    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .editCartItem(cartM: cartM);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    var provider = Provider.of<AddToCartProvider>(context);
    final providerMap = provider.cartData;
    List<CartM> produtList = [];
    if (providerMap['data']?['cartItem'] != null)
      produtList = List<CartM>.from(
          providerMap['data']['cartItem'].map((x) => CartM.fromJson(x)));
    // final listProvider = Provider.of<AddToCartProvider>(context).cartList;

    var price = 0.0;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // print('Total ${providerMap['data']['grandTotal']}');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Shopping List',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: tabLayout
                    ? 35
                    : largeLayout
                        ? 19
                        : 16)),
      ),
      body: isLoading
          ? const Center(
              child: Text(
                'Cart Is Empty',
              ),
            )
          : Container(
              // height: height * 1,
              // width: width * 1,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/Rectangle 392.png'),
              //         fit: BoxFit.cover)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var item = produtList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                providerMap['data']['cartItem'][index]
                                    ['productName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: tabLayout ? 25 : 18),
                              ),
                            ),
                            Container(
                              height: tabLayout
                                  ? height * 0.15
                                  : largeLayout
                                      ? height * 0.11
                                      : height * 0.14,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: EdgeInsets.only(
                                  left: width * 0.02, right: width * 0.02),
                              // color: Colors.red,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    fit: FlexFit.tight,
                                    child: Container(
                                      width: width * 0.50,
                                      // color: Colors.amber,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.012,
                                                bottom: height * 0.012),
                                            child: Container(
                                              width: width * 0.25,
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2))
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Image.network(
                                                    providerMap['data']
                                                            ['cartItem'][index]
                                                        ['mainImage'],
                                                    // listProvider[index]['mainImage'],
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: double.infinity,
                                              // color: Colors.green,
                                              padding: EdgeInsets.only(
                                                  left: width * 0.02,
                                                  top: height * 0.008,
                                                  bottom: height * 0.008),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                // mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (item.discountPercentage >
                                                      0) ...[
                                                    AutoSizeText(
                                                      '₹${item.discountPrice}',
                                                      style:
                                                          productPrice.copyWith(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                  Text(
                                                    '₹${providerMap['data']['cartItem'][index]['price']}',
                                                    style:
                                                        item.discountPercentage ==
                                                                0
                                                            ? productPrice
                                                            : productOfferPrice,
                                                  ),
                                                  Text(
                                                    "${item.getDisplayText}",
                                                    // listProvider[index]['quantity']
                                                    //     .toString(),
                                                    // // textScaleFactor: textScaleFactor,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: tabLayout
                                                            ? 25
                                                            : 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: Container(
                                      height: double.infinity,
                                      // color: Colors.blue,
                                      margin:
                                          EdgeInsets.only(right: width * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (item.quantity > 1) {
                                                    item.quantity--;
                                                    updateCartDecrease(
                                                        cartM: item,
                                                        grandTotal:
                                                            providerMap['data']
                                                                ['grandTotal']);
                                                  } else {
                                                    Provider.of<AddToCartProvider>(
                                                            context,
                                                            listen: false)
                                                        .deleteCartItem(
                                                            cartId:
                                                                item.id.toInt(),
                                                            productId:
                                                                item.productId,
                                                            sizeId:
                                                                item.sizeId);
                                                    print('Rachhel Sekh');
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.remove,
                                                  size: tabLayout
                                                      ? 40
                                                      : largeLayout
                                                          ? 25
                                                          : 20)),
                                          Container(
                                            // height: height * 0.2,
                                            width: !tabLayout && !largeLayout
                                                ? width * 0.07
                                                : width * 0.07,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 2,
                                                    style: BorderStyle.solid),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2))
                                                ]),
                                            child: Center(
                                              child: Text(
                                                  providerMap['data']
                                                              ['cartItem']
                                                          [index]['quantity']
                                                      .toString(),
                                                  // // textScaleFactor: textScaleFactor,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: tabLayout
                                                          ? 20
                                                          : largeLayout
                                                              ? 15
                                                              : 13)),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  item.quantity++;
                                                  updateCartIncrease(
                                                      cartM: item,
                                                      grandTotal:
                                                          providerMap['data']
                                                              ['grandTotal']);
                                                  /* provider['data']['cartItem'][index]
                                                  ['quantity']++;
                                                  print(provider['data']['cartItem']
                                                  [index]['quantity']);
                                                  updateCartIncrease(
                                                      provider['data']['cartItem']
                                                      [index],
                                                      provider['data']['grandTotal']);*/
                                                });
                                              },
                                              child: Icon(Icons.add,
                                                  size: tabLayout
                                                      ? 40
                                                      : largeLayout
                                                          ? 25
                                                          : 20)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: providerMap['data']?['cartItem'].length ?? 0,
                      // itemCount: listProvider.length,
                    ),
                  ),
                  Divider(
                    height: !tabLayout && !largeLayout
                        ? height * 0.005
                        : height * 0.01,
                    color: Colors.grey,
                    thickness: !tabLayout && !largeLayout ? 1 : 2,
                    indent: !tabLayout && !largeLayout ? 20 : 30,
                    endIndent: !tabLayout && !largeLayout ? 20 : 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 32, right: 32, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: tabLayout
                                    ? 35
                                    : largeLayout
                                        ? 22
                                        : 18)),
                        Text(totalAmount == 0 ? '₹0' : '₹${totalAmount ?? 0}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: tabLayout
                                    ? 35
                                    : largeLayout
                                        ? 22
                                        : 18))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.082, right: height * 0.04),
                    child: providerMap['data']?['cartItem'].length == 0
                        ? Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 62),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.04),
                                  child: Text('Proceed To Checkout',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 35
                                              : largeLayout
                                                  ? 22
                                                  : 18)),
                                ),
                              ],
                            ))
                        : InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/checkout-screen', arguments: {
                                'data': providerMap,
                                'tax': provider.taxCalculation,
                                'discountCode': couponCode
                              });
                            },
                            child: Container(
                                width: double.infinity,
                                height: tabLayout
                                    ? height * 0.08
                                    : largeLayout
                                        ? height * 0.06
                                        : height * 0.07,
                                margin: EdgeInsets.only(
                                    top: height > 800
                                        ? height * 0.04
                                        : height * 0.012,
                                    bottom: 70),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(0, 2))
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Text('Proceed To Checkout',
                                          // // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: tabLayout
                                                  ? 35
                                                  : largeLayout
                                                      ? 22
                                                      : 18)),
                                    ),
                                  ],
                                )),
                          ),
                  )
                ],
              ),
            ),
    );
  }
}
